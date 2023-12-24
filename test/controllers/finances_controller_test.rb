require "test_helper"

class FinancesControllerTest < ActionDispatch::IntegrationTest
  test "should get dashboard" do
    get finances_dashboard_url
    assert_response :success
  end
end
