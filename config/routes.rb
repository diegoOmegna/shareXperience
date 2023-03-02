Rails.application.routes.draw do

  devise_for :users
  root to: "pages#home"
  resources :listings do
    resources :bookings, only: [ :new, :create, :index, :show ], module: :listings
  end
  resources :bookings, only: [ :show, :index, :destroy ]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
