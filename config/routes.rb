Rails.application.routes.draw do

  root 'home#index'

  get '/user/:id' => 'issuecontroller#index', as: :id


end
