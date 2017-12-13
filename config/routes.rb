Rails.application.routes.draw do
  root "user#index" #renders the initial page to either login or register
  post 'create' => 'user#create' #action of registering a new user
  post '/sessions/create' => 'sessions#create' #completes action of logging user in
  get 'users/:id' => 'user#show' #rendering the page to display a user's dashboard
  get 'users/:id/edit' => 'user#edit'
  patch 'users/:id' => 'user#update'
  delete 'sessions/:id' => 'sessions#destroy'
  post '/events/create' => 'events#create'
end
