require 'test_helper'

class GoalCellsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @goal_cell = goal_cells(:one)
  end

  test "should get index" do
    get goal_cells_url
    assert_response :success
  end

  test "should get new" do
    get new_goal_cell_url
    assert_response :success
  end

  test "should create goal_cell" do
    assert_difference('GoalCell.count') do
      post goal_cells_url, params: { goal_cell: { cell_id: @goal_cell.cell_id, deadline: @goal_cell.deadline, finished: @goal_cell.finished, name: @goal_cell.name } }
    end

    assert_redirected_to goal_cell_url(GoalCell.last)
  end

  test "should show goal_cell" do
    get goal_cell_url(@goal_cell)
    assert_response :success
  end

  test "should get edit" do
    get edit_goal_cell_url(@goal_cell)
    assert_response :success
  end

  test "should update goal_cell" do
    patch goal_cell_url(@goal_cell), params: { goal_cell: { cell_id: @goal_cell.cell_id, deadline: @goal_cell.deadline, finished: @goal_cell.finished, name: @goal_cell.name } }
    assert_redirected_to goal_cell_url(@goal_cell)
  end

  test "should destroy goal_cell" do
    assert_difference('GoalCell.count', -1) do
      delete goal_cell_url(@goal_cell)
    end

    assert_redirected_to goal_cells_url
  end
end
