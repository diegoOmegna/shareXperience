Rails.application.routes.draw do

  devise_for :users
  root to: "pages#home"
  resource :listings do
    resources :bookings, only: [ :new, :create ]
  end
  resources :bookings, only: [ :show ]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
