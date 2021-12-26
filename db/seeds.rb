require 'csv'

Team.delete_all

CSV.foreach(Rails.root.join('db/team_data.csv'), headers: true) do |row|
  
  Team.create({
    name: row[0],
    league: row[1],
    defense: row[2],
    midfield: row[3],
    attack: row[4],
    overall: row[5],
    logo: row[6],
    rating: row[7]
  })
end