module RostersHelper

  def selectable_teams(roster)
    (Team.all - roster.teams).sort_by(&:name)
  end
end
