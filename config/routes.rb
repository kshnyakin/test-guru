# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users,
             path: :gurus,
             path_names: { sign_in: :login, sign_out: :logout },
             controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }

  root 'tests#index'

  resources :tests, only: :index do
    post :start, on: :member
  end

  resources :test_passings, only: %i[show update] do
    get :result, on: :member
  end

  namespace :admin do
    resources :tests do
      resources :questions, shallow: true, only: %i[show edit update destroy new create] do
        resources :answers, shallow: true, except: :index
      end
    end
  end
end
