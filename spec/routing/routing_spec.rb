require "spec_helper"
 
describe "routing" do

  it "to /" do
    get("/").should route_to("guide#index")
  end

  it "to /Contact" do
    get("/Contact").should route_to("pages#contact")
  end

  it "to /Privacy" do
    get("/Privacy").should route_to("pages#privacy")
  end

  it "to /Login" do
    get("/Login").should route_to("pages#login")
  end

  it "to /Dashboard" do
    get("/Dashboard").should route_to("pages#dashboard")
  end

  it "to /Region" do
    get("/Melbourne").should route_to("guide#show", :region_name => "Melbourne")
  end
    
  it "to /Region/Sport" do
    get("/Melbourne/Cricket").should route_to("guide#show", {:region_name => "Melbourne", :sport_name => "Cricket"})
  end
  
  it "to /assets/obscure_image_name.png" do
    get("/assets/obscure_image_name.png").should_not be_routable
  end
    
  
end
