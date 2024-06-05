require "test_helper"

class TodoItemControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get todo_item_index_url
    assert_response :success
  end
end
