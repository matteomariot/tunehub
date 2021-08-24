require "test_helper"

class PartitionsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get partitions_show_url
    assert_response :success
  end

  test "should get new" do
    get partitions_new_url
    assert_response :success
  end

  test "should get create" do
    get partitions_create_url
    assert_response :success
  end

  test "should get edit" do
    get partitions_edit_url
    assert_response :success
  end

  test "should get update" do
    get partitions_update_url
    assert_response :success
  end

  test "should get destroy" do
    get partitions_destroy_url
    assert_response :success
  end
end
