# frozen_string_literal: true

class Game < ApplicationRecord
  belongs_to :home_player, class_name: 'User', inverse_of: :home_games
  belongs_to :away_player, class_name: 'User', inverse_of: :away_games
  belongs_to :away_team, class_name: 'Team'
  belongs_to :home_team, class_name: 'Team'
  belongs_to :tournament

  scope :played_by, ->(player) { where(home_player: player).or(where(away_player: player)) }
  scope :been_played, -> { where.not(home_score: nil).and(where.not(away_score: nil)) }

  # Ensure both score components are present or none
  validates :home_score, presence: true, if: -> { away_score.present? }
  validates :away_score, presence: true, if: -> { home_score.present? }
  validates :home_score, numericality: { only_integer: true, greater_than_or_equal_to: 0, allow_nil: true }
  validates :away_score, numericality: { only_integer: true, greater_than_or_equal_to: 0, allow_nil: true }



  def winning_side
    return unless played?

    if home_score > away_score
      'home'
    elsif home_score < away_score
      'away'
    else
      'draw'
    end
  end

  def winner
    return if !played? || winning_side == 'draw'
    return home_player if winning_side == 'home'

    away_player
  end

  def played?
    home_score? && away_score?
  end

  def points_for(player)
    return 1 if winning_side == 'draw'
    return 3 if winner == player

    0
  end

  def score
    played? ? "#{home_score} - #{away_score}" : 'TBD'
  end
end
