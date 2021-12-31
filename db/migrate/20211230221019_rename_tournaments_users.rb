class RenameTournamentsUsers < ActiveRecord::Migration[7.0]
  def change
      rename_table :tournaments_users, :tournament_players
  end
end
