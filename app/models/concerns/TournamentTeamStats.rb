module TournamentTeamStats
  extend ActiveSupport::Concern

  def team_points_for(team)
    played_games = games.played_with(team).been_played
    played_games.reduce(0) { |score, game| score + game.points_for(team) }
  end
end
