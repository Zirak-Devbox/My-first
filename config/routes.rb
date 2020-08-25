Rails.application.routes.draw do
  root 'articles#home'
  get 'about', to: 'articles#about'
  resources :articles
  resources :users
  resources :categories, except: [:destroy]
  get 'signup', to: 'users#new'
  post 'users', to: 'users#create'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to:'sessions#destroy'
end
