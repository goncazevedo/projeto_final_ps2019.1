require "application_system_test_case"

class TaskBoardsTest < ApplicationSystemTestCase
  setup do
    @task_board = task_boards(:one)
  end

  test "visiting the index" do
    visit task_boards_url
    assert_selector "h1", text: "Task Boards"
  end

  test "creating a Task board" do
    visit task_boards_url
    click_on "New Task Board"

    fill_in "Description", with: @task_board.description
    fill_in "Finished", with: @task_board.finished
    fill_in "Goal board", with: @task_board.goal_board_id
    fill_in "Name", with: @task_board.name
    click_on "Create Task board"

    assert_text "Task board was successfully created"
    click_on "Back"
  end

  test "updating a Task board" do
    visit task_boards_url
    click_on "Edit", match: :first

    fill_in "Description", with: @task_board.description
    fill_in "Finished", with: @task_board.finished
    fill_in "Goal board", with: @task_board.goal_board_id
    fill_in "Name", with: @task_board.name
    click_on "Update Task board"

    assert_text "Task board was successfully updated"
    click_on "Back"
  end

  test "destroying a Task board" do
    visit task_boards_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Task board was successfully destroyed"
  end
end
