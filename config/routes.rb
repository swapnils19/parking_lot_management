Rails.application.routes.draw do
  resources :parking_lots
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'parking_lots#index'
end
