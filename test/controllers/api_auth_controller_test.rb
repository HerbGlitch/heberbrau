require 'test_helper'

class ApiAuthControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_auth_index_url
    assert_response :success
  end

end
