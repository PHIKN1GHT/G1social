require 'test_helper'

class SitedpostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sitedpost = sitedposts(:one)
  end

  test "should get index" do
    get sitedposts_url
    assert_response :success
  end

  test "should get new" do
    get new_sitedpost_url
    assert_response :success
  end

  test "should create sitedpost" do
    assert_difference('Sitedpost.count') do
      post sitedposts_url, params: { sitedpost: { content: @sitedpost.content, position: @sitedpost.position } }
    end

    assert_redirected_to sitedpost_url(Sitedpost.last)
  end

  test "should show sitedpost" do
    get sitedpost_url(@sitedpost)
    assert_response :success
  end

  test "should get edit" do
    get edit_sitedpost_url(@sitedpost)
    assert_response :success
  end

  test "should update sitedpost" do
    patch sitedpost_url(@sitedpost), params: { sitedpost: { content: @sitedpost.content, position: @sitedpost.position } }
    assert_redirected_to sitedpost_url(@sitedpost)
  end

  test "should destroy sitedpost" do
    assert_difference('Sitedpost.count', -1) do
      delete sitedpost_url(@sitedpost)
    end

    assert_redirected_to sitedposts_url
  end
end
