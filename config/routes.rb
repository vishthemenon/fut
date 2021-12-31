# frozen_string_literal: true

Rails.application.routes.draw do
  resources :tournament_players
  resources :tournament_rosters
  devise_for :users
  resources :tournaments

  # Defines the root path route ("/")
  root 'tournaments#index'
end
