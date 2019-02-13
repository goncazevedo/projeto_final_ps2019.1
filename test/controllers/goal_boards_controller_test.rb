require 'test_helper'

class GoalBoardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @goal_board = goal_boards(:one)
  end

  test "should get index" do
    get goal_boards_url
    assert_response :success
  end

  test "should get new" do
    get new_goal_board_url
    assert_response :success
  end

  test "should create goal_board" do
    assert_difference('GoalBoard.count') do
      post goal_boards_url, params: { goal_board: { board_id: @goal_board.board_id, deadline: @goal_board.deadline, finished: @goal_board.finished, name: @goal_board.name } }
    end

    assert_redirected_to goal_board_url(GoalBoard.last)
  end

  test "should show goal_board" do
    get goal_board_url(@goal_board)
    assert_response :success
  end

  test "should get edit" do
    get edit_goal_board_url(@goal_board)
    assert_response :success
  end

  test "should update goal_board" do
    patch goal_board_url(@goal_board), params: { goal_board: { board_id: @goal_board.board_id, deadline: @goal_board.deadline, finished: @goal_board.finished, name: @goal_board.name } }
    assert_redirected_to goal_board_url(@goal_board)
  end

  test "should destroy goal_board" do
    assert_difference('GoalBoard.count', -1) do
      delete goal_board_url(@goal_board)
    end

    assert_redirected_to goal_boards_url
  end
end
