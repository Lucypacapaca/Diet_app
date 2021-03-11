require 'test_helper'

class Cooks::FoodsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get cooks_foods_new_url
    assert_response :success
  end

  test "should get edit" do
    get cooks_foods_edit_url
    assert_response :success
  end

  test "should get show" do
    get cooks_foods_show_url
    assert_response :success
  end

  test "should get index" do
    get cooks_foods_index_url
    assert_response :success
  end

end
