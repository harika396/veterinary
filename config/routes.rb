Rails.application.routes.draw do
  root to: "appointments#index"

  devise_for :users

  devise_scope :user do
    get '/login'  => 'devise/sessions#new'
    get '/logout' => 'devise/sessions#destroy'
  end   

  resources :appointments
  resources :pets
  resources :pet_types
  resources :users
  resources :addresses
  resources :roles
  resources :profiles
 

end
