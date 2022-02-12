# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :rosters, dependent: :destroy
  has_many :tournament_players, dependent: :destroy
  has_many :tournaments, through: :tournament_players

  has_many :home_games, class_name: 'Game', foreign_key: :home_player_id, dependent: :destroy, inverse_of: :home_player
  has_many :away_games, class_name: 'Game', foreign_key: :home_player_id, dependent: :destroy, inverse_of: :away_player

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  def games
    home_games + away_games
  end
end
