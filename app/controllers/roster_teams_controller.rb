class RosterTeamsController < ApplicationController
  before_action :set_roster, only: [:new]


  # GET /rosters/:roster_id/roster_teams/new
  def new
    @roster.teams.new
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_roster
    @roster = Roster.find(params[:roster_id])
  end
end
