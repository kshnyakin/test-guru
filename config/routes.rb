# frozen_string_literal: true

Rails.application.routes.draw do
  root 'tests#index'

  get  :signup, to: 'users#new'
  get  :login,  to: 'sessions#new'
  delete :logout, to: 'sessions#destroy'

  resources :users, only: :create
  resources :sessions, only: :create

  resources :tests, shallow: true do
    resources :questions, only: %i[show edit update destroy new create] do
      resources :answers, shallow: true, except: :index
    end

    post :start, on: :member
  end

  resources :test_passings, only: %i[show update] do
    get :result, on: :member
  end
end
