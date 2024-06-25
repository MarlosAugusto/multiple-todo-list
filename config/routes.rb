Rails.application.routes.draw do
  resources :todos do
    member do
      put :sort
    end
  end
  resources :lists do
    member do
      put :sort
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "lists#index"
end
