Rails.application.routes.draw do
  resources :feedbacks

  root to: 'visitors#index'
  devise_for :users
  resources :users
end
