# frozen_string_literal: true

class Tournament < ApplicationRecord
  include TournamentPlayerStats
  has_many :tournament_players, dependent: :destroy
  has_many :players, through: :tournament_players, source: :user

  has_many :rosters, dependent: :destroy

  has_many :games, dependent: :destroy

  enum status: { created: 0, started: 1, ended: 2 }

  before_update :generate_fixtures, if: [:started?, :status_changed?]

  def started?
    status == 'started'
  end

  private

  def generate_fixtures
    rosters.each do |home_roster|
      rosters.excluding(home_roster).each do |away_roster|
        home_roster.teams.each do |home_team|
          away_roster.teams.each do |away_team|
            games.new home_team: home_team,
                      away_team: away_team,
                      home_player: home_roster.user,
                      away_player: away_roster.user
          end
        end
      end
    end
  end
end

