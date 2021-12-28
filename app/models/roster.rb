# frozen_string_literal: true

class Roster < ApplicationRecord
  has_and_belongs_to_many :teams
  has_and_belongs_to_many :tournaments
  belongs_to :user
end
