# frozen_string_literal: true

class Game < ApplicationRecord
  belongs_to :home_player, class_name: 'User'
  belongs_to :away_player, class_name: 'User'
  belongs_to :away_team, class_name: 'Team'
  belongs_to :home_team, class_name: 'Team'

  def winning_side
    return unless home_score? && away_score?

    if home_score > away_score
      'home'
    elsif home_score < away_score
      'away'
    else
      'draw'
    end
  end
end
