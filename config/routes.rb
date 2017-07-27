Rails.application.routes.draw do
  put '/jarvis/:api_token', to: 'jarvis/syncs#update', as: :jarvis_update
  post '/jarvis', to: 'jarvis/syncs#create', as: :jarvis_create
  delete '/jarvis/:api_token', to: 'jarvis/syncs#destroy', as: :jarvis_delete
  get '/sso/:api_token', to: 'jarvis/syncs#login', as: :jarvis_sso

  get '/jarvis/user', to: 'jarvis/user#show'
  post '/jarvis/user', to: 'jarvis/user#create'
  put '/jarvis/user', to: 'jarvis/user#update'
  patch '/jarvis/user', to: 'jarvis/user#update'
  delete '/jarvis/user', to: 'jarvis/user#destroy'


end
