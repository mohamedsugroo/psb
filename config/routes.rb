Rails.application.routes.draw do
  get 'api/index'
  namespace :api do
    namespace :v1 do
      get 'users/index'
    end
  end
  root 'home#index'
  # resources :transfers


  # test the jwt class
  # get 'auth/test', to: 'authentication#test'

  resources :users, param: :_username
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'

  namespace :api do
    namespace :v1 do
      resources :apps
      resources :users
      post 'search', to: 'search#index'
      post '/friends', to: 'friends#index'
      post '/addfriend', to: 'friends#create'
      get '/users',  to: 'users#index'
      post '/users/create',  to: 'users#create'
  		post '/transfers',  to: 'transfers#index'
  		post '/send',  to: 'transfers#sendto'
  		post '/request',  to: 'transfers#payment_request'
  		post '/pendingtransactions', to: 'pendingrequests#index'
  		post '/pendingrequest', to: 'pendingrequests#pending'
      post '/approverequest', to: 'pendingrequests#approve'
      post '/declinerequest', to: 'pendingrequests#decline'
  		post '/sentrequests', to: 'pendingrequests#sent'
      post '/spent', to: 'pendingrequests#moneyspent'
      post '/income', to: 'pendingrequests#moneyincome'
      post '/transactions', to: 'transfers#history'
      post '/finduserbyid', to: 'pendingrequests#finduserbyid'
  	end
  end


end
