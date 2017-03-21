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
  resources :practices do
    resources :appointments, only: [:create]
  end
  resources :conversations, only: [:index,:create] do
    resources :messages, only: [:index,:create]
  end
  
  resources :practices do
    resources :reviews, only: [:create,:destroy]
  end
  get '/preload' => 'appointments#preload'
  get '/your_trips' => 'appointments#your_trips'
end
