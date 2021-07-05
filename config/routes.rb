Rails.application.routes.draw do
  root 'sessions#new'
  
  get '/sessions/new'
  get 'users/new'
  get '/users/:id' => 'users#show'
  get '/users/:id/edit' => 'users#edit'

  post '/session' => 'sessions#create'
  delete '/sessions/:id' => 'sessions#destroy'
  post '/users' => 'users#register'
  patch '/update/:id' => 'users#update'
  delete '/delete/:id' => 'users#delete'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
