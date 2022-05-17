require "test_helper"

class Admin::MoviesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_movies_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_movies_show_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_movies_destroy_url
    assert_response :success
  end
end
