class RosterTeamsController < ApplicationController
  before_action :set_roster, only: [:new, :create]

  # GET /rosters/:roster_id/roster_teams/new
  def new
    @roster.roster_teams.new
  end

  # GET /rosters/:roster_id/roster_teams/new
  def create
    @roster.roster_teams.find_or_create_by team: Team.find(roster_team_params)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_roster
    @roster = Roster.find(params[:roster_id])
  end

  # Only allow a list of trusted parameters through.
  def roster_team_params
    params.fetch(:roster_team).require(:team)
  end
end
