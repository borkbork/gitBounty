Rails.application.routes.draw do
  get '/login'  => 'sessions#create', as: :login
  get '/logout' => 'sessions#destroy', as: :logout

  resources :user
  resources :title
  post '/title' => 'title#new', as: :titles
  delete '/title/:id' => 'title#destroy', as: :destroy_title
  get '/title/lang/:lang' => 'title#lang', as: :titles_lang
  root 'home#index'

  get '/user/:id' => 'issuecontroller#index', as: :id


end
