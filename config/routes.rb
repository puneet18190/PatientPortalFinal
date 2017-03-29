Rails.application.routes.draw do
  

  root 'pages#home'

  devise_for 	:users, 
  						:path => '', 
  						:path_names => {:sign_in => 'login', :sign_out => 'logout', :edit => 'profile'},
  						:controllers => {:omniauth_callbacks => 'omniauth_callbacks',
  														 :registrations => 'registrations'
  														}

  resources :users, only: [:show]
  resources :practices
  resources :photos
  resources :reports
  resources :bloodsugars
  resources :bloodpressures
  resources :temperatures
  resources :weights
  resources :heartbeats
  resources :practices do
    resources :appointments, only: [:create]
  end
  resources :conversations, only: [:index,:create] do
    resources :messages, only: [:index,:create]
  end
  
  resources :practices do
    resources :reviews, only: [:create,:destroy]
  end
  
  get '/vital' => 'pages#vital'
  
  get '/preload' => 'appointments#preload'
  get '/preview' => 'appointments#preview'

  get '/your_trips' => 'appointments#your_trips'
  get '/your_appointments' => 'appointments#your_appointments'

  post '/notify' => 'appointments#notify'
  post '/your_trips' => 'appointments#your_trips'

  get 'check_date_time' => 'appointments#check_date_time'
  
end