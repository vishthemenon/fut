class RenameRostersTeams < ActiveRecord::Migration[7.0]
  def change
    rename_table :rosters_teams, :roster_teams
  end
end
