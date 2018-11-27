require 'test_helper'

class MokusControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get mokus_index_url
    assert_response :success
  end

end
