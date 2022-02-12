# frozen_string_literal: true

class Team < ApplicationRecord
  belongs_to :league
  has_many :roster_teams, dependent: :destroy
  has_many :rosters, through: :roster_teams
end
