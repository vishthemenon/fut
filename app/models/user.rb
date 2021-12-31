# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :rosters, dependent: :destroy
  has_many :tournament_players, dependent: :destroy
  has_many :tournaments, through: :tournament_players

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
