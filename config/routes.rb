Rails.application.routes.draw do
  put '/jarvis/:jarvis_token', to: 'jarvis/syncs#update', as: :jarvis_update
  post '/jarvis', to: 'jarvis/syncs#create', as: :jarvis_create
  delete '/jarvis/:jarvis_token', to: 'jarvis/syncs#destroy', as: :jarvis_delete
  get '/sso/:jarvis_token', to: 'jarvis/syncs#login'
  #devise_for :users, controllers: {sessions: "sessions"}
end
