require 'test_helper'

class ProfileControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get profile_index_url
    assert_response :success
  end

  def setup
    @campaign = Campaigns.new(name: "Test", creator: 1, slot: 1)
  end

  test "should be valid" do
    assert @campaign.valid?
  end

  test "name should be present" do
    @campaign.creator = nil
    assert_not @campaign.valid?
  end

  test "email should be present" do
    @campaign.slot = nil
    assert_not @campaign.valid?
  end


end
