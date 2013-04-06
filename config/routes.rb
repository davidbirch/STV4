STV4::Application.routes.draw do

  require 'subdomain'
    
  # -------------------------------------------------------
  # special route for all subdomains
  constraints (Subdomain) do
    get '/'        => 'pages#mobile_under_construction'
    get '/*every'  => 'pages#mobile_under_construction'
  end
    
  # -------------------------------------------------------
  # static pages of supporting information
  get 'Login'    => 'pages#login'
  get 'Dashboard'=> 'pages#dashboard'
  get 'Privacy'  => 'pages#privacy'
  get 'Contact'  => 'pages#contact'
  
  # -------------------------------------------------------
  # specific secured resource routes
  resources :programs
  resources :regions
  resources :sports
  resources :sport_keywords
     
  resources :channels do
    member do
      put "toggle_black_flag"
    end
  end
  
    
  # -------------------------------------------------------
  # special routes - these need to be last // catch all
  
  #scope :constraints => { :protocol => 'http' } do  

    # special routes for /region
    get ':region_name' => 'guide#show', :constraints => {:format => "html"}
      
    # special route for /region/sport
    get ':region_name/:sport_name' => 'guide#show', :constraints => {:format => "html"}
  
  #end
  
  # -------------------------------------------------------
  # default route to the region index page
  root :to => 'guide#index'
  
  
 end
