Jarvis::Enginer.routes.draw do
  get '/jarvis/user', to: 'jarvis/user#show'
  post '/jarvis/user', to: 'jarvis/user#create'
  put '/jarvis/user', to: 'jarvis/user#update'
  patch '/jarvis/user', to: 'jarvis/user#update'
  delete '/jarvis/user', to: 'jarvis/user#destroy'
end
