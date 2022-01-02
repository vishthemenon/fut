class TournamentRoster < ApplicationRecord
  belongs_to :tournament
  belongs_to :roster
end
