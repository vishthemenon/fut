# frozen_string_literal: true

class CreateTournaments < ActiveRecord::Migration[7.0]
  def change
    create_table :tournaments do |t|
      t.string :name

      t.timestamps
    end

    create_table :rosters_tournaments, id: false do |t|
      t.belongs_to :tournament
      t.belongs_to :roster
    end

    create_table :tournaments_users, id: false do |t|
      t.belongs_to :tournament
      t.belongs_to :user
    end
  end
end
