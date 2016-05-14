Rails.application.routes.draw do
  get '/login'  => 'sessions#create', as: :login
  get '/logout' => 'sessions#destroy', as: :logout

  resources :user
  get ':type/:id/repos' => 'repo#list', as: :repos
  get ':type/:id/repos/:repo_id' => 'repo#show', as: :repo
  get ':type/:id/repos/:repo_id/issues' => 'issue#list', as: :issues
  get ':type/:id/repos/:repo_id/issues/:issue_id' => 'issue#show', as: :issue

  root 'home#index'

end
