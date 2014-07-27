Rails.application.routes.draw do
  resources :questions

  resources :annual_summary_reports

  resources :feedbacks

  root to: 'annual_summary_reports#index'
  devise_for :users
  resources :users
end
