require 'test_helper'

class FusionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fusion = fusions(:one)
  end

  test "should get index" do
    get fusions_url
    assert_response :success
  end

  test "should get new" do
    get new_fusion_url
    assert_response :success
  end

  test "should create fusion" do
    assert_difference('Fusion.count') do
      post fusions_url, params: { fusion: { board_id: @fusion.board_id, user_id: @fusion.user_id } }
    end

    assert_redirected_to fusion_url(Fusion.last)
  end

  test "should show fusion" do
    get fusion_url(@fusion)
    assert_response :success
  end

  test "should get edit" do
    get edit_fusion_url(@fusion)
    assert_response :success
  end

  test "should update fusion" do
    patch fusion_url(@fusion), params: { fusion: { board_id: @fusion.board_id, user_id: @fusion.user_id } }
    assert_redirected_to fusion_url(@fusion)
  end

  test "should destroy fusion" do
    assert_difference('Fusion.count', -1) do
      delete fusion_url(@fusion)
    end

    assert_redirected_to fusions_url
  end
end
