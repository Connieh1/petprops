Rails.application.routes.draw do
  root "application#home"
  get "home", to: "application#home"

  resources :users

  resources :pets

  resources :posts do
    resources :pets, only: [:index, :show, :new]
  end

 

end
