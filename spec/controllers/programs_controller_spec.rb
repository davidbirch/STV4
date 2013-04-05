require 'spec_helper'

describe ProgramsController do
  
  include AuthHelper
  
  describe "GET #index (unauthenticated via https)" do
    before :each do
      request.env['HTTPS'] = 'on'
      get :index
    end
    
    it "should return a 401 with no basic auth" do
      response.status.should == 401
    end
  end

  describe "GET #index (unauthenticated via http)" do
    before :each do
      get :index
    end
    
    it "should return a 301 redirect to the https site" do
      response.status.should == 301
    end
  end
  
  describe "GET #index (authenticated via http)" do
    before :each do
      http_login
      get :index
    end
    
    it "should return a 301 redirect to the https site" do
      response.status.should == 301
    end
  end
  
  describe "GET #index (authenticated via https)" do
    before :each do
      request.env['HTTPS'] = 'on'
      http_login
      @program = FactoryGirl.create(:program)
      get :index
    end
    
    it "should return a 200 with valid basic auth" do
      response.status.should == 200
    end
    
    it "populates an array of programs" do
      assigns(:programs).should eq([@program])
    end
    
    it "renders the :index view" do
      response.should render_template :index
    end
  end
  
  describe "GET #show (authenticated via https)" do
    before :each do
      request.env['HTTPS'] = 'on'
      http_login
      @program = FactoryGirl.create(:program)
      get :show, id: @program
    end
        
    it "assigns the requested program to @program" do
      assigns(:program).should eq(@program)
    end
        
    it "renders the :show template" do
      response.should render_template :show
    end
  end
  
  describe "GET #edit (authenticated via https)" do
    before :each do
      request.env['HTTPS'] = 'on'
      http_login
      @program = FactoryGirl.create(:program)
      get :edit, id: @program
    end
        
    it "assigns the requested program to @program" do
      assigns(:program).should eq(@program)
    end
        
    it "renders the :edit template" do
      response.should render_template :edit
    end
  end
  
  describe "GET #new (authenticated via https)" do
    before :each do
      request.env['HTTPS'] = 'on'
      http_login
      get :new
    end
      
    it "assigns a new Program as @program" do
      assigns(:program).should be_a_new(Program)
    end
    
    it "renders the :new template" do
      response.should render_template :new
    end
    
  end
  
  describe "POST #create (authenticated via https)" do
    before :each do
      request.env['HTTPS'] = 'on'
      http_login
    end
    
    context "with valid attributes" do
      #it "creates a new program" do
      #  expect{
      #  post :create, program: FactoryGirl.attributes_for(:valid_program)
      #  }.to change(Program,:count).by(1)
      #end
      #      
      #it "redirects to the new program" do
      #  post :create, program: FactoryGirl.attributes_for(:valid_program)
      #  response.should redirect_to Program.last
      #end
    end
    
    context "with invalid attributes" do
      it "does not save the new program" do
        expect{
        post :create, program: FactoryGirl.attributes_for(:invalid_program)
        }.to_not change(Program,:count)
      end
      
      it "re-renders the new method" do
        post :create, program: FactoryGirl.attributes_for(:invalid_program)
        response.should render_template :new
      end 
    end
  end
  
  describe 'PUT #update (authenticated via https)' do
    before :each do
      request.env['HTTPS'] = 'on'
      http_login
      @program = FactoryGirl.create(:valid_program)
    end
  
    context "valid attributes" do
      it "located the requested @program" do
        put :update, id: @program, program: FactoryGirl.attributes_for(:valid_program)
        assigns(:program).should eq(@program)      
      end
    
      it "changes @programs's attributes" do
        put :update, id: @program, program: FactoryGirl.attributes_for(:valid_program, title: "Sydney Swans")
        @program.reload
        @program.title.should eq("Sydney Swans")
      end
    
      it "redirects to the updated program" do
        put :update, id: @program, program: FactoryGirl.attributes_for(:valid_program)
        response.should redirect_to @program
      end
    end
    
    context "invalid attributes" do
      it "locates the requested @program" do
        put :update, id: @program, program: FactoryGirl.attributes_for(:invalid_program)
        assigns(:program).should eq(@program)      
      end
      
      it "does not change @program's attributes" do
        put :update, id: @program, program: FactoryGirl.attributes_for(:program, title: nil)
        @program.reload
        @program.title.should_not eq("")
      end
      
      it "re-renders the edit method" do
        put :update, id: @program, program: FactoryGirl.attributes_for(:invalid_program)
        response.should render_template :edit
      end
    end
  end
    
  describe 'DELETE #destroy (authenticated via https)' do
    before :each do
      request.env['HTTPS'] = 'on'
      http_login
      @program = FactoryGirl.create(:program)
    end
    
    it "deletes the program" do
      expect{
        delete :destroy, id: @program        
      }.to change(Program,:count).by(-1)
    end
      
    it "redirects to programs#index" do
      delete :destroy, id: @program
      response.should redirect_to programs_url
    end
  end
  
end  