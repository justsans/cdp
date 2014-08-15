Rails.application.routes.draw do
  resources :feedback_sections

  resources :feedbacks  do
    collection do
      post 'sendFeedbackRequest'
      get 'pending'
    end

    resources :feedback_sections

  end

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
