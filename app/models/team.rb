# frozen_string_literal: true

class Team < ApplicationRecord
  belongs_to :league
  has_and_belongs_to_many :rosters
end
