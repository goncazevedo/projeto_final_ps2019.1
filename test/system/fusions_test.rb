require "application_system_test_case"

class FusionsTest < ApplicationSystemTestCase
  setup do
    @fusion = fusions(:one)
  end

  test "visiting the index" do
    visit fusions_url
    assert_selector "h1", text: "Fusions"
  end

  test "creating a Fusion" do
    visit fusions_url
    click_on "New Fusion"

    fill_in "Board", with: @fusion.board_id
    fill_in "User", with: @fusion.user_id
    click_on "Create Fusion"

    assert_text "Fusion was successfully created"
    click_on "Back"
  end

  test "updating a Fusion" do
    visit fusions_url
    click_on "Edit", match: :first

    fill_in "Board", with: @fusion.board_id
    fill_in "User", with: @fusion.user_id
    click_on "Update Fusion"

    assert_text "Fusion was successfully updated"
    click_on "Back"
  end

  test "destroying a Fusion" do
    visit fusions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Fusion was successfully destroyed"
  end
end
