Jarvis::Engine.routes.draw do
  get '/user', to: 'user#show'
  post '/user', to: 'user#create'
  put '/user', to: 'user#update'
  patch '/user', to: 'user#update'
  delete '/user', to: 'user#destroy'
end
