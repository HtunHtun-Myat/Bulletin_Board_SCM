Rails.application.routes.draw do
  default_url_options :host => "localhost:3000"
  get 'password_resets/new'
  # root route
  root 'sessions#index'
  # login route
  get 'login', to: "sessions#index"
  post 'login', to: "sessions#create"
  get 'register', to: "sessions#new"
  post 'register', to: "sessions#register"
  get 'authorized', to: 'sessions#page_requires_login'
  get 'logout', to: 'sessions#destory'

  # user routes
  get '/users/export', to: 'users#export'
  resources :users
  # post routes
  get '/posts/export', to: 'posts#export'
  resources :posts
  # resert password
  resources :password_resets
  get '/password_resets/.*/edit/', to: 'password_resets#edit'
  # not found route
  get ':not_found' => 'posts#index',
  :constraints => { :not_found => /.*/ }
end
