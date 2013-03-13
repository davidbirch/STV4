class PagesController < ApplicationController
  
  force_ssl :except => [:about, :privacy, :contact, :mobile_under_construction]
  before_filter :authenticate, :except => [:about, :privacy, :contact, :mobile_under_construction]
  
  def mobile_under_construction
    @title = "SPORT ON TV"
    @meta_keywords = "mobile, sport, television, guide, coverage, tonight, Australia, Melbourne, Sydney, Brisbane, Adalaide, Perth"
    @meta_description = "Your guide for sport on television in Australia.  Find out when sport is on Free-to-air or Pay TV.  Watch live sport on TV tonight."   
    
    render :layout => 'mobile'  
  end
  
  def privacy
    @title = "Privacy Statement | Sport on Television in Australia"
    @breadcrumb = "Privacy"
    @meta_keywords = "privacy, sport, television, guide, coverage, tonight, Australia, Melbourne, Sydney, Brisbane, Adalaide, Perth"
    @meta_description = "Your guide for sport on television in Australia.  Find out when sport is on Free-to-air or Pay TV.  Watch live sport on TV tonight."   
    
  end

  def contact
    @title = "Contact Us | Sport on Television in Australia"
    @breadcrumb = "Contact"
    @meta_keywords = "contact, sport, television, guide, coverage, tonight, Australia, Melbourne, Sydney, Brisbane, Adalaide, Perth"
    @meta_description = "Your guide for sport on television in Australia.  Find out when sport is on Free-to-air or Pay TV.  Watch live sport on TV tonight."   
    
  end
  
  def login
    @title = "Login | Sport on Television in Australia"
    @breadcrumb = "Login"
    @meta_keywords = "login, sport, television, guide, coverage, tonight, Australia, Melbourne, Sydney, Brisbane, Adalaide, Perth"
    @meta_description = "Your guide for sport on television in Australia.  Find out when sport is on Free-to-air or Pay TV.  Watch live sport on TV tonight."   
    
    redirect_to "/Dashboard"
  end
  
  def dashboard
    @title = "Dashboard | Sport on Television in Australia"
    @breadcrumb = "Dashboard"
    @meta_keywords = "dashboard, sport, television, guide, coverage, tonight, Australia, Melbourne, Sydney, Brisbane, Adalaide, Perth"
    @meta_description = "Your guide for sport on television in Australia.  Find out when sport is on Free-to-air or Pay TV.  Watch live sport on TV tonight."   
    
  end
  
end
