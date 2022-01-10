# frozen_string_literal: true

class TournamentTableComponent < ViewComponent::Base
  def initialize(tournament:)
    @tournament = tournament
  end

end
