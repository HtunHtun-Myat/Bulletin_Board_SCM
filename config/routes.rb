Rails.application.routes.draw do
  # root route
  root 'sessions#index'
  # login route
  get 'login', to: "sessions#index"
  post 'login', to: "sessions#create"
  get 'authorized', to: 'sessions#page_requires_login'
  get 'logout', to: 'sessions#destory'

  # user routes
  resources :users
  # post routes
  get '/posts/export', to: 'posts#export'
  resources :posts
  # not found route
  get ':not_found' => 'posts#index',
  :constraints => { :not_found => /.*/ }

end
