Rails.application.routes.draw do

  # Api Version 2 routes

  namespace :api do
    namespace :v2 do
      get '/', to: 'home#index' # root / get
      post '/', to: 'home#index' # root / post
      get '/login', to: 'home#login' # login user authentication
      get '/resetpassword', to: 'home#resetpassword'
      get '/check_token', to: 'home#check_token'

      # routes with emails

      get '/change_password', to: 'users#change_password'

      resources :users, only: [:create, :update]

      namespace :apps do 
      end # apps

      # transaction routes
      get '/transactions', to: 'transactions#index'

    end # version
  end # api



  # Api Version 1 routes
  root 'api#index'
  namespace :api do
    namespace :v1 do
      # connect
      namespace :connect do 
        get '/', to: 'connect#index'
      end
      get 'users/index'
      # get '/apps', to: 'apps#index'
      resources :apps
    end
  end
  # root 'home#index'
  # resources :transfers


  # test the jwt class
  # get 'auth/test', to: 'authentication#test'

  resources :users, param: :_username
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'

  namespace :api do
    namespace :v1 do
      # resources :apps
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
