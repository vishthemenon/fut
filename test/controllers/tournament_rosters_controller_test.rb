require 'test_helper'

class TournamentRostersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tournament_roster = tournament_rosters(:one)
  end

  test 'should get index' do
    get tournament_rosters_url
    assert_response :success
  end

  test 'should get new' do
    get new_tournament_roster_url
    assert_response :success
  end

  test 'should create tournament_roster' do
    assert_difference('TournamentRoster.count') do
      post tournament_rosters_url, params: { tournament_roster: {} }
    end

    assert_redirected_to tournament_roster_url(TournamentRoster.last)
  end

  test 'should show tournament_roster' do
    get tournament_roster_url(@tournament_roster)
    assert_response :success
  end

  test 'should get edit' do
    get edit_tournament_roster_url(@tournament_roster)
    assert_response :success
  end

  test 'should update tournament_roster' do
    patch tournament_roster_url(@tournament_roster), params: { tournament_roster: {} }
    assert_redirected_to tournament_roster_url(@tournament_roster)
  end

  test 'should destroy tournament_roster' do
    assert_difference('TournamentRoster.count', -1) do
      delete tournament_roster_url(@tournament_roster)
    end

    assert_redirected_to tournament_rosters_url
  end
end
