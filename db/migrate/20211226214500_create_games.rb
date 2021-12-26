class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.references :home_player, foreign_key: {to_table: :users, on_delete: :cascade}
      t.references :away_player, foreign_key: {to_table: :users, on_delete: :cascade}
      t.references :home_team, foreign_key: {to_table: :teams, on_delete: :cascade}
      t.references :away_team, foreign_key: {to_table: :teams, on_delete: :cascade}
      t.integer :home_score
      t.integer :away_score
      t.datetime :played_at

      t.timestamps
    end
  end
end
