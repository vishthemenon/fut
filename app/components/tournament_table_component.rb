# frozen_string_literal: true

class TournamentTableComponent < ViewComponent::Base
  def initialize(tournament:)
    super
    @tournament = tournament
    @sorted_teams = @tournament.teams.sort_by do |team|
      [@tournament.team_points_for(team), @tournament.team_goal_difference(team),
       -1 * @tournament.games.been_played.played_with(team).count]
    end.reverse
  end
end
