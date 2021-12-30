# frozen_string_literal: true

class TournamentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @tournaments = current_user.tournaments
  end

  def new
    @tournament = Tournament.new
  end

  def create
    Rails.logger.debug @tournament
  end
end
