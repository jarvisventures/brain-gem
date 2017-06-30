Rails.application.routes.draw do
  put '/jarvis/:api_token', to: 'jarvis/syncs#update', as: :jarvis_update
  post '/jarvis', to: 'jarvis/syncs#create', as: :jarvis_create
  delete '/jarvis/:api_token', to: 'jarvis/syncs#destroy', as: :jarvis_delete
  get '/sso/:api_token', to: 'jarvis/syncs#login', as: :jarvis_sso
end
