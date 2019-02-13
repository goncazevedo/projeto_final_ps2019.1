require "application_system_test_case"

class GoalBoardsTest < ApplicationSystemTestCase
  setup do
    @goal_board = goal_boards(:one)
  end

  test "visiting the index" do
    visit goal_boards_url
    assert_selector "h1", text: "Goal Boards"
  end

  test "creating a Goal board" do
    visit goal_boards_url
    click_on "New Goal Board"

    fill_in "Board", with: @goal_board.board_id
    fill_in "Deadline", with: @goal_board.deadline
    fill_in "Finished", with: @goal_board.finished
    fill_in "Name", with: @goal_board.name
    click_on "Create Goal board"

    assert_text "Goal board was successfully created"
    click_on "Back"
  end

  test "updating a Goal board" do
    visit goal_boards_url
    click_on "Edit", match: :first

    fill_in "Board", with: @goal_board.board_id
    fill_in "Deadline", with: @goal_board.deadline
    fill_in "Finished", with: @goal_board.finished
    fill_in "Name", with: @goal_board.name
    click_on "Update Goal board"

    assert_text "Goal board was successfully updated"
    click_on "Back"
  end

  test "destroying a Goal board" do
    visit goal_boards_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Goal board was successfully destroyed"
  end
end
