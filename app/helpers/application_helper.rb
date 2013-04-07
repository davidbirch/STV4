module ApplicationHelper
  
  def logged_in?
    not request.authorization.nil?
  end
  
  def title(title = nil)
    #log = Logger.new(File.expand_path("#{Rails.root}/log/application_helper.log", __FILE__))
    #log.info("#{site_variables.inspect}")
    
    if title.present?
      title
    elsif @title.present?
      @title
    else
      site_variables["default_title"]
    end
  end
  
  def meta_author(meta_author = nil)
    
    
    if meta_author.present?
      meta_author
    elsif @meta_author.present?
      @meta_author
    else
      site_variables["default_meta_author"]
    end
  end
  
  def meta_keywords(meta_keywords = nil)
    if meta_keywords.present?
      meta_keywords
    elsif @meta_keywords.present?
      @meta_keywords
    else
      site_variables["default_meta_keywords"]
    end
  end
  
  def meta_description(meta_description = nil)
    if meta_description.present?
      meta_description
    elsif @meta_description.present?
      @meta_description
    else
      site_variables["default_meta_description"]
    end
  end
   
  def region_touch_icon_extension(region_touch_icon_extension = nil)
    if region_touch_icon_extension.present?
      region_touch_icon_extension
    elsif @region_touch_icon_extension.present?
      @region_touch_icon_extension
    else
      site_variables["default_region_touch_icon_extension"]
    end
  end
  
  
  
  
  
  
  private
  
    def site_variables
      site_variables_yaml = YAML.load_file(File.expand_path("#{Rails.root}/config/site_variables.yml", __FILE__))
      site_variables_yaml[Rails.env]
    end
    
end
