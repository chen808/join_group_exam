Rails.application.routes.draw do
  
  get '/sessions' => 'sessions#new' #<----- This is initial route when web page is loaded up
 
  get '/users/:id' => 'users#show' #<------ This comes from user controller 'login' method

  get '/groups/:id' => 'groups#join'

  get '/groups/:id/join_group' => 'groups#join_group'

  get '/groups/:id/leave_group' => 'groups#leave_group'

  post '/users' => 'users#login'  #<------- When existing user logs in from views > sessions > new.html.erb

  post '/groups' => 'groups#create' # creating new group

  post '/sessions' => 'sessions#create' #<---- When new user signs up from views > sessions > new.html.erb

  delete '/groups/:id' => 'groups#destroy_group'

  delete '/sessions' => 'sessions#destroy' #<---- When user logs out

end
