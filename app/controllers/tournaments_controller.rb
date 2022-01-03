# frozen_string_literal: true

class TournamentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tournament, only: %i[show update destroy]

  def index
    @tournaments = current_user.tournaments.includes(:players)
  end

  def new
    @tournament = Tournament.new
  end

  def show; end

  # POST /tournaments
  def create
    params = new_tournament_params
    params[:players] = params[:players].filter_map { |name| User.find_by(name: name) }
    @tournament = Tournament.new(params)

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

  def update
    respond_to do |format|
      if @tournament.update(update_tournament_params)
        format.html do
          redirect_to tournament_url(@tournament), notice: 'Tournament was successfully updated.'
        end
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tournament
    @tournament = Tournament.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def new_tournament_params
    params.fetch(:tournament).permit(:name, players: [])
  end

  # Only allow a list of trusted parameters through.
  def update_tournament_params
    params.fetch(:tournament).permit(:status)
  end
end
