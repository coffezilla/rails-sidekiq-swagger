require "test_helper"

class ApiListUsersTest < ActionDispatch::IntegrationTest
  test "should get list of users" do
    # request
    get "/users"

    # response
    assert_response :success

    # structure
    json_response = JSON.parse(response.body)
    assert_kind_of Array, json_response
    assert_not_empty json_response
  end
end