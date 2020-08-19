Rails.application.routes.draw do
  root 'articles#home'
  get 'about', to: 'articles#about'
  resources :articles
end
