class GamesController < ApplicationController
  before_action :set_game, only: [:edit, :update]

  def edit; end

  def update
    respond_to do |format|
      if @game.update(games_params)
        format.html do
          redirect_to tournament_url(@game.tournament), notice: 'Game was successfully updated.'
        end
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  private

  def games_params
    params.fetch(:game).permit(:home_score, :away_score)
  end

  def set_game
    @game = Game.find(params[:id])
  end
end
