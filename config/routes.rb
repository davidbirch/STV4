STV4::Application.routes.draw do

  # -------------------------------------------------------
  # default route to the region index page
  root :to => 'guide#index'
  
  # -------------------------------------------------------
  # static pages of supporting information
  match 'About'    => 'pages#about'
  match 'Login'    => 'pages#login'
  match 'Dashboard'=> 'pages#dashboard'
  match 'Privacy'  => 'pages#privacy'
  match 'Contact'  => 'pages#contact'
  
  # -------------------------------------------------------
  # specific resource routes
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
  
  # special routes for /region
  match ':region_name' => 'guide#show'
    
  # special route for /region/sport
  match ':region_name/:sport_name' => 'guide#show'
  
  
 end
