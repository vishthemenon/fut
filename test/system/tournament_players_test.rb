require 'application_system_test_case'

class TournamentPlayersTest < ApplicationSystemTestCase
  setup do
    @tournament_player = tournament_players(:one)
  end

  test 'visiting the index' do
    visit tournament_players_url
    assert_selector 'h1', text: 'Tournament players'
  end

  test 'should create tournament player' do
    visit tournament_players_url
    click_on 'New tournament player'

    click_on 'Create Tournament player'

    assert_text 'Tournament player was successfully created'
    click_on 'Back'
  end

  test 'should update Tournament player' do
    visit tournament_player_url(@tournament_player)
    click_on 'Edit this tournament player', match: :first

    click_on 'Update Tournament player'

    assert_text 'Tournament player was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Tournament player' do
    visit tournament_player_url(@tournament_player)
    click_on 'Destroy this tournament player', match: :first

    assert_text 'Tournament player was successfully destroyed'
  end
end
