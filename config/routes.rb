Rails.application.routes.draw do
  root 'sessions#index'
  get  'user/new',       to: 'user#new'
  post 'user/new',       to: 'user#create'
  post 'sessions/new',   to: 'sessions#create'
  post 'posts/new',      to: 'posts#create'
  resources :sessions
  resources :posts,    only: [:new, :create, :index]

end
