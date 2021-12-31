require 'test_helper'

class TournamentPlayersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tournament_player = tournament_players(:one)
  end

  test 'should get index' do
    get tournament_players_url
    assert_response :success
  end

  test 'should get new' do
    get new_tournament_player_url
    assert_response :success
  end

  test 'should create tournament_player' do
    assert_difference('TournamentPlayer.count') do
      post tournament_players_url, params: { tournament_player: {} }
    end

    assert_redirected_to tournament_player_url(TournamentPlayer.last)
  end

  test 'should show tournament_player' do
    get tournament_player_url(@tournament_player)
    assert_response :success
  end

  test 'should get edit' do
    get edit_tournament_player_url(@tournament_player)
    assert_response :success
  end

  test 'should update tournament_player' do
    patch tournament_player_url(@tournament_player), params: { tournament_player: {} }
    assert_redirected_to tournament_player_url(@tournament_player)
  end

  test 'should destroy tournament_player' do
    assert_difference('TournamentPlayer.count', -1) do
      delete tournament_player_url(@tournament_player)
    end

    assert_redirected_to tournament_players_url
  end
end
