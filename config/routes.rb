# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :tournaments do
    resources :rosters, only: [:index]
    resources :games, shallow: true
  end

  resources :rosters, only: [] do
    resources :roster_teams, only: [:create, :destroy]
  end

  # Defines the root path route ("/")
  root 'tournaments#index'
end
