require "test_helper"

class QueriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get queries_index_url
    assert_response :success
  end

  test "should get results" do
    get queries_results_url
    assert_response :success
  end
end
