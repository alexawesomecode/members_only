Rails.application.routes.draw do
  # get 'sessions/new'
  get  'sessions/new',   to: 'sessions#new'
  post 'sessions/new',   to: 'sessions#create'
  root 'sessions#index'
  post 'posts/new',      to: 'posts#create'
  resources :sessions
  resources :posts, only: [:new, :create, :index]

end
