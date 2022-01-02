# frozen_string_literal: true

class RostersController < ApplicationController
  before_action :set_tournament, only: [:new]


  # GET /tournament/:tournament_id/rosters/new
  def new
    @tournament.players.map { |player| @tournament.rosters.find_or_initialize_by user: player }
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tournament
    @tournament = Tournament.find(params[:tournament_id])
  end
end
