require 'test_helper'

class DmControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dm_index_url
    assert_response :success
  end

end
