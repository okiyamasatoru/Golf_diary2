require "test_helper"

class Public::CustomerControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_customer_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_customer_edit_url
    assert_response :success
  end
end
