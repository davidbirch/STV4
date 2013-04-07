class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :common_variables
  
  #log = Logger.new(File.expand_path("#{Rails.root}/log/controller.log", __FILE__))
  #log.info("I can log from the application controller")
    
  def common_variables
    # these variables are used in the layout across the entire site
    @regions = Region.all
    @sports = Sport.all
  end
    
  protected
    
    def authenticate
      basic_auth_yaml = YAML.load_file(File.expand_path("#{Rails.root}/config/basic_auth.yml", __FILE__))
      basic_auth_config = basic_auth_yaml[Rails.env]
      
      #log = Logger.new(File.expand_path("#{Rails.root}/log/controller.log", __FILE__))
      #log.info("The username is #{basic_auth_yaml["username"]}")
      
      authenticate_or_request_with_http_basic do |username, password|
        username == basic_auth_config["username"] && password == basic_auth_config["password"]
      end
    end
   
end
