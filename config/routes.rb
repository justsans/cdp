Rails.application.routes.draw do
  resources :answers

  resources :questions

  resources :annual_summary_reports do
    member do
      post 'answer'
    end
    resources :answers
  end

  root to: 'annual_summary_reports#index'
  devise_for :users
  resources :users
end
