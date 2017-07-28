Jarvis::Engine.routes.draw do
  get '/user', to: 'user#show'
  post '/user', to: 'user#create'
  put '/user', to: 'user#update'
  patch '/user', to: 'user#update'
  delete '/user', to: 'user#destroy'

  get '/company', to: 'company#show'
  post '/company', to: 'company#create'
  put '/company', to: 'company#update'
  patch '/company', to: 'company#update'
  delete '/company', to: 'company#destroy'

  get '/department', to: 'department#show'
  post '/department', to: 'department#create'
  put '/department', to: 'department#update'
  patch '/department', to: 'department#update'
  delete '/department', to: 'department#destroy'

  get '/division', to: 'division#show'
  post '/division', to: 'division#create'
  put '/division', to: 'division#update'
  patch '/division', to: 'division#update'
  delete '/division', to: 'division#destroy'

  get '/email', to: 'email#show'
  post '/email', to: 'email#create'
  put '/email', to: 'email#update'
  patch '/email', to: 'email#update'
  delete '/email', to: 'email#destroy'

  get '/email_tag', to: 'email_tag#show'
  post '/email_tag', to: 'email_tag#create'
  put '/email_tag', to: 'email_tag#update'
  patch '/email_tag', to: 'email_tag#update'
  delete '/email_tag', to: 'email_tag#destroy'

  get '/location', to: 'location#show'
  post '/location', to: 'location#create'
  put '/location', to: 'location#update'
  patch '/location', to: 'location#update'
  delete '/location', to: 'location#destroy'

  get '/phone_number', to: 'phone_number#show'
  post '/phone_number', to: 'phone_number#create'
  put '/phone_number', to: 'phone_number#update'
  patch '/phone_number', to: 'phone_number#update'
  delete '/phone_number', to: 'phone_number#destroy'

  get '/phone_number_tag', to: 'phone_number_tag#show'
  post '/phone_number_tag', to: 'phone_number_tag#create'
  put '/phone_number_tag', to: 'phone_number_tag#update'
  patch '/phone_number_tag', to: 'phone_number_tag#update'
  delete '/phone_number_tag', to: 'phone_number_tag#destroy'

  get '/tag', to: 'tag#show'
  post '/tag', to: 'tag#create'
  put '/tag', to: 'tag#update'
  patch '/tag', to: 'tag#update'
  delete '/tag', to: 'tag#destroy'

  get '/user_tag', to: 'user_tag#show'
  post '/user_tag', to: 'user_tag#create'
  put '/user_tag', to: 'user_tag#update'
  patch '/user_tag', to: 'user_tag#update'
  delete '/user_tag', to: 'user_tag#destroy'
end
