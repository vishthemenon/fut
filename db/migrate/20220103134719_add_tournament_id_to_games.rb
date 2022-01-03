class AddTournamentIdToGames < ActiveRecord::Migration[7.0]
  def change
    add_reference :games, :tournament, index: true
  end
end
