require 'test_helper'

class ForemControllerTest < ActionController::TestCase
  test "should get base" do
    get :base
    assert_response :success
  end

end
