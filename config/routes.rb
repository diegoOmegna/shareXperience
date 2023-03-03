Rails.application.routes.draw do
  get 'reviews/new'

  devise_for :users
  root to: "pages#home"
  resources :listings do
    resources :bookings, only: [ :index, :show ], module: :listings
    resources :reviews, only: [:new, :create]
  end
  resources :bookings, only: [ :new, :create, :show, :index, :destroy ]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
