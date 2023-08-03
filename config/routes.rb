# frozen_string_literal: true

Rails.application.routes.draw do
  get 'tests/index'
  resources :tests, shallow: true, only: %i[index show] do
    resources :questions
  end
end
