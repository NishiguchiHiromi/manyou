Rails.application.routes.draw do
  resources :labels


  resources :tasks
  resources :users
  resources :sessions

  namespace :admin do
    resources :users
  end
end
