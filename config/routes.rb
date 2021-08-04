# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resources :rents
    resources :cars
  end

  resources :rents # , only: [:new, :create, :show]

  root 'home#index'
end
