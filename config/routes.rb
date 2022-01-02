# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :tournaments do
    resources :rosters, shallow: true do
      resources :roster_teams, shallow: true
    end
  end

  # Defines the root path route ("/")
  root 'tournaments#index'
end
