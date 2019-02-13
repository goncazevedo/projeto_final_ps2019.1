require "application_system_test_case"

class GoalCellsTest < ApplicationSystemTestCase
  setup do
    @goal_cell = goal_cells(:one)
  end

  test "visiting the index" do
    visit goal_cells_url
    assert_selector "h1", text: "Goal Cells"
  end

  test "creating a Goal cell" do
    visit goal_cells_url
    click_on "New Goal Cell"

    fill_in "Cell", with: @goal_cell.cell_id
    fill_in "Deadline", with: @goal_cell.deadline
    fill_in "Finished", with: @goal_cell.finished
    fill_in "Name", with: @goal_cell.name
    click_on "Create Goal cell"

    assert_text "Goal cell was successfully created"
    click_on "Back"
  end

  test "updating a Goal cell" do
    visit goal_cells_url
    click_on "Edit", match: :first

    fill_in "Cell", with: @goal_cell.cell_id
    fill_in "Deadline", with: @goal_cell.deadline
    fill_in "Finished", with: @goal_cell.finished
    fill_in "Name", with: @goal_cell.name
    click_on "Update Goal cell"

    assert_text "Goal cell was successfully updated"
    click_on "Back"
  end

  test "destroying a Goal cell" do
    visit goal_cells_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Goal cell was successfully destroyed"
  end
end
