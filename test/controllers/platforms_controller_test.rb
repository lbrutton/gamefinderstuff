require 'test_helper'

class PlatformsControllerTest < ActionController::TestCase
  test "should get ios" do
    get :ios
    assert_response :success
  end

  test "should get android" do
    get :android
    assert_response :success
  end

end
