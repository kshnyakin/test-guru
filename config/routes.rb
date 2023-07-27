# frozen_string_literal: true

Rails.application.routes.draw do
  resources :tests, only: [] do
    resources :questions, only: %i[index show new create destroy]
  end
end
