class TournamentRoster < ApplicationRecord
  belongs_to :roster
  belongs_to :tournament
end
