Rails.application.routes.draw do
  # get 'sessions/new'
  get  'sessions/new',   to: 'sessions#new'
  post 'sessions/new',   to: 'sessions#create'
  resources :sessions
end
