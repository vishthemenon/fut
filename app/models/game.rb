# frozen_string_literal: true

class Game < ApplicationRecord
  belongs_to :home_player, class_name: 'User', inverse_of: :home_games
  belongs_to :away_player, class_name: 'User', inverse_of: :away_games
  belongs_to :away_team, class_name: 'Team'
  belongs_to :home_team, class_name: 'Team'
  belongs_to :tournament

  scope :played_by, ->(player) { where(home_player: player).or(where(away_player: player)) }
  scope :played_with, ->(team) { where(home_team: team).or(where(away_team: team)) }
  scope :been_played, -> { where.not(home_score: nil).and(where.not(away_score: nil)) }
  scope :not_played, -> { where(home_score: nil).where(away_score: nil) }

  # Ensure both score components are present or none
  validates :home_score, presence: true, if: -> { away_score.present? }
  validates :away_score, presence: true, if: -> { home_score.present? }
  validates :home_score, numericality: { only_integer: true, greater_than_or_equal_to: 0, allow_nil: true }
  validates :away_score, numericality: { only_integer: true, greater_than_or_equal_to: 0, allow_nil: true }

  def winning_side
    return unless played?
    return 'draw' if home_score == away_score

    home_score > away_score ? 'home' : 'away'
  end

  def winning_player
    return if !played? || winning_side == 'draw'
    return home_player if winning_side == 'home'

    away_player
  end
  alias winner winning_player

  def winning_team
    return if !played? || winning_side == 'draw'
    return home_team if winning_side == 'home'

    away_team
  end

  def points_for(team_or_player)
    return 1 if winning_side == 'draw'
    return 3 if winning_player == team_or_player
    return 3 if winning_team == team_or_player

    0
  end

  def played?
    !home_score.nil? && !away_score.nil?
  end

  def score
    played? ? "#{home_score} - #{away_score}" : 'TBD'
  end

  def goals_for(team_or_player)
    return home_score if (home_player == team_or_player) || (home_team == team_or_player)
    return away_score if (away_score == team_or_player) || (away_team == team_or_player)

    0
  end

  def goals_against(team_or_player)
    return away_score if (home_player == team_or_player) || (home_team == team_or_player)
    return home_score if (away_score == team_or_player) || (away_team == team_or_player)

    0
  end
end
