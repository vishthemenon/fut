module Relegatable
  extend ActiveSupport::Concern

  def relegated?(team)
    sorted_teams = self.sorted_teams

    return true if sorted_teams.last(2).include? team
  end

  private

  def sorted_teams
    teams.sort_by do |team|
      [team_points_for(team), team_goal_difference(team), -1 * games.been_played.played_with(team).count]
    end.reverse
  end
end
