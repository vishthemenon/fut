class TournamentRostersController < ApplicationController
  before_action :set_tournament_roster, only: %i[show edit update destroy]

  # GET /tournament_rosters or /tournament_rosters.json
  def index
    @tournament_rosters = TournamentRoster.all
  end

  # GET /tournament_rosters/1 or /tournament_rosters/1.json
  def show; end

  # GET /tournament_rosters/new
  def new
    @tournament_roster = TournamentRoster.new
  end

  # GET /tournament_rosters/1/edit
  def edit; end

  # POST /tournament_rosters or /tournament_rosters.json
  def create
    @tournament_roster = TournamentRoster.new(tournament_roster_params)

    respond_to do |format|
      if @tournament_roster.save
        format.html do
          redirect_to tournament_roster_url(@tournament_roster), notice: 'Tournament roster was successfully created.'
        end
        format.json { render :show, status: :created, location: @tournament_roster }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tournament_roster.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tournament_rosters/1 or /tournament_rosters/1.json
  def update
    respond_to do |format|
      if @tournament_roster.update(tournament_roster_params)
        format.html do
          redirect_to tournament_roster_url(@tournament_roster), notice: 'Tournament roster was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @tournament_roster }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tournament_roster.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tournament_rosters/1 or /tournament_rosters/1.json
  def destroy
    @tournament_roster.destroy

    respond_to do |format|
      format.html { redirect_to tournament_rosters_url, notice: 'Tournament roster was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tournament_roster
    @tournament_roster = TournamentRoster.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def tournament_roster_params
    params.fetch(:tournament_roster, {})
  end
end
