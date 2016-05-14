Rails.application.routes.draw do
  get '/login'  => 'sessions#create', as: :login
  get '/logout' => 'sessions#destroy', as: :logout

  resources :user

  root 'home#index'

  get '/user/:id' => 'issuecontroller#index', as: :id


end
