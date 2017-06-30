Rails.application.routes.draw do
  put '/jarvis/:user_id', to: 'jarvis/syncs#update', as: :jarvis_update
  post '/jarvis', to: 'jarvis/syncs#create', as: :jarvis_create
  delete '/jarvis/:user_id', to: 'jarvis/syncs#destroy', as: :jarvis_delete
end
