STV4::Application.routes.draw do

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
