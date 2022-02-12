module TournamentTeamAnalysable
  extend ActiveSupport::Concern

  def team_points_for(team)
    played_games = games.played_with(team).been_played
    played_games.reduce(0) { |score, game| score + game.points_for(team) }
  end

  def team_goals_for(team)
    played_games = games.played_with(team).been_played
    played_games.reduce(0) { |score, game| score + game.goals_for(team) }
  end

  def team_goals_against(team)
    played_games = games.played_with(team).been_played
    played_games.reduce(0) { |score, game| score + game.goals_against(team) }
  end

  def team_goal_difference(team)
    played_games = games.played_with(team).been_played
    played_games.reduce(0) { |score, game| score + game.goals_for(team) - game.goals_against(team) }
  end
end
