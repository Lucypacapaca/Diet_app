require 'test_helper'

class Cooks::RecipesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get cooks_recipes_new_url
    assert_response :success
  end

  test "should get edit" do
    get cooks_recipes_edit_url
    assert_response :success
  end

  test "should get show" do
    get cooks_recipes_show_url
    assert_response :success
  end

  test "should get index" do
    get cooks_recipes_index_url
    assert_response :success
  end

end
