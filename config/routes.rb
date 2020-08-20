Rails.application.routes.draw do
  root 'articles#home'
  get 'about', to: 'articles#about'
  resources :articles
  resources :users
  get 'signup', to: 'users#new'
  post 'users', to: 'users#create'
end
