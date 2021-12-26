class CreateTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :league
      t.integer :defense
      t.integer :midfield
      t.integer :attack
      t.integer :overall
      t.string :logo
      t.float :rating

      t.timestamps
    end
  end
end
