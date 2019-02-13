require "application_system_test_case"

class TaskCellsTest < ApplicationSystemTestCase
  setup do
    @task_cell = task_cells(:one)
  end

  test "visiting the index" do
    visit task_cells_url
    assert_selector "h1", text: "Task Cells"
  end

  test "creating a Task cell" do
    visit task_cells_url
    click_on "New Task Cell"

    fill_in "Description", with: @task_cell.description
    fill_in "Finished", with: @task_cell.finished
    fill_in "Goal cell", with: @task_cell.goal_cell_id
    fill_in "Name", with: @task_cell.name
    click_on "Create Task cell"

    assert_text "Task cell was successfully created"
    click_on "Back"
  end

  test "updating a Task cell" do
    visit task_cells_url
    click_on "Edit", match: :first

    fill_in "Description", with: @task_cell.description
    fill_in "Finished", with: @task_cell.finished
    fill_in "Goal cell", with: @task_cell.goal_cell_id
    fill_in "Name", with: @task_cell.name
    click_on "Update Task cell"

    assert_text "Task cell was successfully updated"
    click_on "Back"
  end

  test "destroying a Task cell" do
    visit task_cells_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Task cell was successfully destroyed"
  end
end
