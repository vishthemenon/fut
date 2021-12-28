# frozen_string_literal: true

class CreateRosters < ActiveRecord::Migration[7.0]
  def change
    create_table :rosters do |t|
      t.belongs_to :user
      t.timestamps
    end

    create_table :rosters_teams, id: false do |t|
      t.belongs_to :roster
      t.belongs_to :team
    end
  end
end
