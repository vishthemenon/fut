# frozen_string_literal: true

class Tournament < ApplicationRecord
  has_many :tournament_players, dependent: :destroy
  has_many :players, through: :tournament_players, source: :user

  has_many :tournament_rosters, dependent: :destroy
  has_many :rosters, through: :tournament_rosters
end
