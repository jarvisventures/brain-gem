Rails.application.routes.draw do
  put '/jarvis/:api_token', to: 'jarvis/syncs#update', as: :jarvis_update
  post '/jarvis', to: 'jarvis/syncs#create', as: :jarvis_create
  delete '/jarvis/:api_token', to: 'jarvis/syncs#destroy', as: :jarvis_delete
  get '/sso/:api_token', to: 'jarvis/syncs#login', as: :jarvis_sso

  get '/jarvis/users/(:id)', to: 'jarvis/user#show', as: :user
  post '/jarvis/users', to: 'jarvis/user#create', as: :users
  put '/jarvis/users/(:id)', to: 'jarvis/user#update', as: :user
  patch '/jarvis/users/(:id)', to: 'jarvis/user#update', as: :user
  delete '/jarvis/users/(:id)', to: 'jarvis/user#destroy', as: :user

  
end
