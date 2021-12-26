class Game < ApplicationRecord
  belongs_to :home_player,  class_name: "User"
  belongs_to :away_player,  class_name: "User"
  belongs_to :away_team,  class_name: "Team"
  belongs_to :home_team,  class_name: "Team"

  def winning_side
    if self.home_score? and self.away_score?
      if self.home_score > self.away_score
        "home"
      elsif self.home_score < self.away_score
        "away"
      else
        "draw"
      end
    end
  end
end
