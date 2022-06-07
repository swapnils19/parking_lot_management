Rails.application.routes.draw do
  resources :cars, except: %i[edit update]
  resources :parking_lots do
    resources :entrances, expect: %i[update edit show]
    resources :spots, expect: %i[update edit show]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'parking_lots#index'
end
