require 'test_helper'

class MokuTypeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get moku_type_index_url
    assert_response :success
  end

  test "should get show" do
    get moku_type_show_url
    assert_response :success
  end

end
