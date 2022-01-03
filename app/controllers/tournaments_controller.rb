# frozen_string_literal: true

class TournamentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tournament, only: %i[show edit update destroy]

  def index
    @tournaments = current_user.tournaments.includes(:players)
  end

  def new
    @tournament = Tournament.new
  end

  def create
    tournament_params = get_tournament_params
    tournament_params[:players] = tournament_params[:players].filter_map { |name| User.find_by(name: name) }
    @tournament = Tournament.new(tournament_params)

    @tournament.rosters = @tournament.players.map { |player| player.rosters.create }

    respond_to do |format|
      if @tournament.save
        format.html do
          redirect_to tournament_rosters_path(@tournament), notice: 'Tournament was successfully created.'
        end
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tournament
    @tournament = Tournament.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def get_tournament_params
    params.fetch(:tournament).permit(:name, players: [])
  end
end
