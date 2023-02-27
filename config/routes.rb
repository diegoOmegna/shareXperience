Rails.application.routes.draw do

  get "listings/new", to: "listings#new"
  post "listings/new", to: "listings#create"
  get "listings/:id", to: "listings#show", as: "show"
  devise_for :users
  root to: "pages#home"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html


end
