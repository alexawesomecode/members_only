Rails.application.routes.draw do
  root 'sessions#index'
  post 'sessions/new',   to: 'sessions#create'
  post 'posts/new',      to: 'posts#create'
  resources :sessions
  resources :posts,    only: [:new, :create, :index]

end
