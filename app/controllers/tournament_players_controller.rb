class TournamentPlayersController < ApplicationController
  before_action :set_tournament_player, only: %i[show edit update destroy]

  # GET /tournament_players or /tournament_players.json
  def index
    @tournament_players = TournamentPlayer.all
  end

  # GET /tournament_players/1 or /tournament_players/1.json
  def show; end

  # GET /tournament_players/new
  def new
    @tournament_player = TournamentPlayer.new
  end

  # GET /tournament_players/1/edit
  def edit; end

  # POST /tournament_players or /tournament_players.json
  def create
    @tournament_player = TournamentPlayer.new(tournament_player_params)

    respond_to do |format|
      if @tournament_player.save
        format.html do
          redirect_to tournament_player_url(@tournament_player), notice: 'Tournament player was successfully created.'
        end
        format.json { render :show, status: :created, location: @tournament_player }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tournament_player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tournament_players/1 or /tournament_players/1.json
  def update
    respond_to do |format|
      if @tournament_player.update(tournament_player_params)
        format.html do
          redirect_to tournament_player_url(@tournament_player), notice: 'Tournament player was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @tournament_player }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tournament_player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tournament_players/1 or /tournament_players/1.json
  def destroy
    @tournament_player.destroy

    respond_to do |format|
      format.html { redirect_to tournament_players_url, notice: 'Tournament player was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tournament_player
    @tournament_player = TournamentPlayer.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def tournament_player_params
    params.fetch(:tournament_player, {})
  end
end
