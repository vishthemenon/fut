# frozen_string_literal: true

class Roster < ApplicationRecord
  has_many :roster_teams, dependent: :destroy
  has_many :teams, through: :roster_teams

  has_many :tournament_rosters, dependent: :destroy
  has_many :tournaments, through: :tournament_rosters

  belongs_to :user
end
