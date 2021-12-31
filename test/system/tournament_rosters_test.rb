require 'application_system_test_case'

class TournamentRostersTest < ApplicationSystemTestCase
  setup do
    @tournament_roster = tournament_rosters(:one)
  end

  test 'visiting the index' do
    visit tournament_rosters_url
    assert_selector 'h1', text: 'Tournament rosters'
  end

  test 'should create tournament roster' do
    visit tournament_rosters_url
    click_on 'New tournament roster'

    click_on 'Create Tournament roster'

    assert_text 'Tournament roster was successfully created'
    click_on 'Back'
  end

  test 'should update Tournament roster' do
    visit tournament_roster_url(@tournament_roster)
    click_on 'Edit this tournament roster', match: :first

    click_on 'Update Tournament roster'

    assert_text 'Tournament roster was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Tournament roster' do
    visit tournament_roster_url(@tournament_roster)
    click_on 'Destroy this tournament roster', match: :first

    assert_text 'Tournament roster was successfully destroyed'
  end
end
