STV4::Application.routes.draw do

  resources :sport_keywords

  resources :raw_channels

  resources :raw_programs

  resources :programs

  resources :channels

  resources :sports

  # -------------------------------------------------------
  # default route to the region index page
  root :to => 'pages#home'
  
  # -------------------------------------------------------
  # resources 
  resources :regions, :only => [:index, :show]


 end
