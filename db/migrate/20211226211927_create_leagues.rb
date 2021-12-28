# frozen_string_literal: true

class CreateLeagues < ActiveRecord::Migration[7.0]
  def change
    create_table :leagues do |t|
      t.string :name
      t.string :country

      t.timestamps
    end

    add_reference :teams, :league, foreign_key: true
    remove_column :teams, :league, :string
  end
end
