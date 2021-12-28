# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_12_26_235859) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.bigint "home_player_id"
    t.bigint "away_player_id"
    t.bigint "home_team_id"
    t.bigint "away_team_id"
    t.integer "home_score"
    t.integer "away_score"
    t.datetime "played_at", precision: 6
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["away_player_id"], name: "index_games_on_away_player_id"
    t.index ["away_team_id"], name: "index_games_on_away_team_id"
    t.index ["home_player_id"], name: "index_games_on_home_player_id"
    t.index ["home_team_id"], name: "index_games_on_home_team_id"
  end

  create_table "leagues", force: :cascade do |t|
    t.string "name"
    t.string "country"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rosters", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_rosters_on_user_id"
  end

  create_table "rosters_teams", id: false, force: :cascade do |t|
    t.bigint "roster_id"
    t.bigint "team_id"
    t.index ["roster_id"], name: "index_rosters_teams_on_roster_id"
    t.index ["team_id"], name: "index_rosters_teams_on_team_id"
  end

  create_table "rosters_tournaments", id: false, force: :cascade do |t|
    t.bigint "tournament_id"
    t.bigint "roster_id"
    t.index ["roster_id"], name: "index_rosters_tournaments_on_roster_id"
    t.index ["tournament_id"], name: "index_rosters_tournaments_on_tournament_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.integer "defense"
    t.integer "midfield"
    t.integer "attack"
    t.integer "overall"
    t.string "logo"
    t.float "rating"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "league_id"
    t.index ["league_id"], name: "index_teams_on_league_id"
  end

  create_table "tournaments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: 6
    t.datetime "remember_created_at", precision: 6
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "games", "teams", column: "away_team_id", on_delete: :cascade
  add_foreign_key "games", "teams", column: "home_team_id", on_delete: :cascade
  add_foreign_key "games", "users", column: "away_player_id", on_delete: :cascade
  add_foreign_key "games", "users", column: "home_player_id", on_delete: :cascade
  add_foreign_key "teams", "leagues"
end
