Rails.application.routes.draw do
  root "application#home"
  get "home", to: "application#home"

  resources :users

  resources :pets, only: [:index, :show]

  resources :posts do
    resources :pets, only: [:index, :show, :new, :create]
  end

 

end
