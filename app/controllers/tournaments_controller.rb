class TournamentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @tournaments = current_user.tournaments
  end

  def new
    @tournament = Tournament.new
  end
end
