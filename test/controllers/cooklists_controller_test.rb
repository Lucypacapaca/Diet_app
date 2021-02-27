require 'test_helper'

class CooklistsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get cooklists_new_url
    assert_response :success
  end

  test "should get edit" do
    get cooklists_edit_url
    assert_response :success
  end

  test "should get show" do
    get cooklists_show_url
    assert_response :success
  end

end
