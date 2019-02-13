require 'test_helper'

class TaskBoardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task_board = task_boards(:one)
  end

  test "should get index" do
    get task_boards_url
    assert_response :success
  end

  test "should get new" do
    get new_task_board_url
    assert_response :success
  end

  test "should create task_board" do
    assert_difference('TaskBoard.count') do
      post task_boards_url, params: { task_board: { description: @task_board.description, finished: @task_board.finished, goal_board_id: @task_board.goal_board_id, name: @task_board.name } }
    end

    assert_redirected_to task_board_url(TaskBoard.last)
  end

  test "should show task_board" do
    get task_board_url(@task_board)
    assert_response :success
  end

  test "should get edit" do
    get edit_task_board_url(@task_board)
    assert_response :success
  end

  test "should update task_board" do
    patch task_board_url(@task_board), params: { task_board: { description: @task_board.description, finished: @task_board.finished, goal_board_id: @task_board.goal_board_id, name: @task_board.name } }
    assert_redirected_to task_board_url(@task_board)
  end

  test "should destroy task_board" do
    assert_difference('TaskBoard.count', -1) do
      delete task_board_url(@task_board)
    end

    assert_redirected_to task_boards_url
  end
end
