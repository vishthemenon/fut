class TournamentPlayer < ApplicationRecord
  belongs_to :tournament
  belongs_to :user
end
