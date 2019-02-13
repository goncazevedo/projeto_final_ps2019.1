require 'test_helper'

class TaskCellsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task_cell = task_cells(:one)
  end

  test "should get index" do
    get task_cells_url
    assert_response :success
  end

  test "should get new" do
    get new_task_cell_url
    assert_response :success
  end

  test "should create task_cell" do
    assert_difference('TaskCell.count') do
      post task_cells_url, params: { task_cell: { description: @task_cell.description, finished: @task_cell.finished, goal_cell_id: @task_cell.goal_cell_id, name: @task_cell.name } }
    end

    assert_redirected_to task_cell_url(TaskCell.last)
  end

  test "should show task_cell" do
    get task_cell_url(@task_cell)
    assert_response :success
  end

  test "should get edit" do
    get edit_task_cell_url(@task_cell)
    assert_response :success
  end

  test "should update task_cell" do
    patch task_cell_url(@task_cell), params: { task_cell: { description: @task_cell.description, finished: @task_cell.finished, goal_cell_id: @task_cell.goal_cell_id, name: @task_cell.name } }
    assert_redirected_to task_cell_url(@task_cell)
  end

  test "should destroy task_cell" do
    assert_difference('TaskCell.count', -1) do
      delete task_cell_url(@task_cell)
    end

    assert_redirected_to task_cells_url
  end
end
