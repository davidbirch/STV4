module AuthHelper
  def http_login
    basic_auth_yaml = YAML.load_file(File.expand_path("#{Rails.root}/config/basic_auth.yml", __FILE__))
    basic_auth_config = basic_auth_yaml[Rails.env]
      
    request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(basic_auth_config["username"],basic_auth_config["password"])
  end
end
 
module AuthRequestHelper
  #
  # pass the @env along with your request, eg:
  #
  # GET '/labels', {}, @env
  #
  def http_login
    @env ||= {}
    
    basic_auth_yaml = YAML.load_file(File.expand_path("#{Rails.root}/config/basic_auth.yml", __FILE__))
    basic_auth_config = basic_auth_yaml[Rails.env]
    
    @env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(basic_auth_config["username"],basic_auth_config["password"])
  end
end