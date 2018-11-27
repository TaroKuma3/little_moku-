require 'test_helper'

class WorkControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get work_index_url
    assert_response :success
  end

  test "should get show" do
    get work_show_url
    assert_response :success
  end

end
