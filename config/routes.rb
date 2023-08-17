# frozen_string_literal: true

Rails.application.routes.draw do
  root 'tests#index'
  resources :tests, shallow: true do
    resources :questions, only: %i[show edit update destroy new create] do
      resources :answers, shallow: true, except: :index
    end

    member do
      post :start
    end
  end

  resources :test_passings, only: %i[show update] do
    member do
      get :result
    end
  end
end
