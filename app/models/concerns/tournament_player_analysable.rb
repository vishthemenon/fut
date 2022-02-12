module TournamentPlayerAnalysable
  extend ActiveSupport::Concern

  def points_for(player)
    played_games = games.played_by(player).been_played
    played_games.reduce(0) { |score, game| score + game.points_for(player) }
  end
end
