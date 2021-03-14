require 'test_helper'

class ChoiceCountsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get choice_counts_create_url
    assert_response :success
  end

end
