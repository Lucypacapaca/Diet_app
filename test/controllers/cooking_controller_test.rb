require 'test_helper'

class CookingControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cooking_index_url
    assert_response :success
  end

  test "should get show" do
    get cooking_show_url
    assert_response :success
  end

  test "should get new" do
    get cooking_new_url
    assert_response :success
  end

  test "should get edit" do
    get cooking_edit_url
    assert_response :success
  end

end
