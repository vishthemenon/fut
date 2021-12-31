class RenameRostersTournaments < ActiveRecord::Migration[7.0]
  def change
    rename_table :rosters_tournaments, :tournament_rosters
  end
end
