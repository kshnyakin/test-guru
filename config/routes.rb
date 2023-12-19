# frozen_string_literal: true

Rails.application.routes.draw do
  get  '/feedback',          to: 'feedback#new'
  post '/feedback',          to: 'feedback#create'
  get  '/feedback-complete', to: 'feedback#success'

  devise_for :users,
             path: :gurus,
             path_names: { sign_in: :login, sign_out: :logout },
             controllers: {
               registrations: 'users/registrations',
               sessions: 'users/sessions',
               confirmations: 'users/confirmations',
               passwords: 'users/passwords'
             }

  root 'tests#index'

  resources :tests, only: :index do
    post :start, on: :member
  end

  resources :badge_templates, only: :index
  resources :badges, only: :index

  resources :test_passings, only: %i[show update] do
    get :result, on: :member
  end

  resources :gists, only: :create

  namespace :admin do
    resources :badge_templates, only: %i[show edit update]
    resources :tests do
      patch :update_inline, on: :member
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
  end
end
