Rails.application.routes.draw do
  put '/jarvis/:user_id' => 'jarvis/syncs#update'
  post '/jarvis' => 'jarvis/syncs#create'
  delete '/jarvis/:user_id' => 'jarvis/syncs#destroy'
end
