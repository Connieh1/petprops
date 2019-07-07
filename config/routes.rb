Rails.application.routes.draw do
  root "application#home"
  get "home", to: "application#home"

  get '/signup', to: "users#new"
  resources :users, except: [:new] do
  	resources :pets, only: [:index, :show, :new]
  end

  resources :pets

  resources :posts

end
