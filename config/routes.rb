Rails.application.routes.draw do
  root 'sessions#new'
  
  get '/sessions/new'
  get 'users/new'
  get '/users/:id' => 'users#show'

  post '/session' => 'sessions#create'
  delete '/sessions/:id' => 'sessions#destroy'
  post '/users' => 'users#register'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
