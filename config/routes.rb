# frozen_string_literal: true

Rails.application.routes.draw do
  root 'tests#index'
  resources :tests, shallow: true do
    resources :questions, only: %i[show edit update destroy new create]
  end
end
