# frozen_string_literal: true

Rails.application.routes.draw do
  resources :test, shallow: true, only: [] do
    resources :questions
  end
end
