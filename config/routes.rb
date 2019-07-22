Rails.application.routes.draw do
  root "application#home"
  get "home", to: "application#home"

  get '/signup', to: "users#new"
  resources :users, except: [:new] do
  	resources :pets
  end

  resources :pets do
    resources :posts, only: [:new, :create, :edit, :destroy, :index, :show]
  end

  resources :posts do
    resources :comments, only: [:create]
  end


  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/auth/google_oauth2/callback', to: 'authorizations#create'

  # get '/welcome', to: 'authorizations#welcome'

end
