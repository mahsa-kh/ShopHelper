require 'test_helper'

class OderControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get oder_index_url
    assert_response :success
  end

  test "should get new" do
    get oder_new_url
    assert_response :success
  end

  test "should get create" do
    get oder_create_url
    assert_response :success
  end

  test "should get show" do
    get oder_show_url
    assert_response :success
  end

  test "should get edit" do
    get oder_edit_url
    assert_response :success
  end

  test "should get update" do
    get oder_update_url
    assert_response :success
  end

  test "should get destroy" do
    get oder_destroy_url
    assert_response :success
  end

end
