require 'test_helper'

class CoursestafftracksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @coursestafftrack = coursestafftracks(:one)
  end

  test "should get index" do
    get coursestafftracks_url
    assert_response :success
  end

  test "should get new" do
    get new_coursestafftrack_url
    assert_response :success
  end

  test "should create coursestafftrack" do
    assert_difference('Coursestafftrack.count') do
      post coursestafftracks_url, params: { coursestafftrack: {  } }
    end

    assert_redirected_to coursestafftrack_url(Coursestafftrack.last)
  end

  test "should show coursestafftrack" do
    get coursestafftrack_url(@coursestafftrack)
    assert_response :success
  end

  test "should get edit" do
    get edit_coursestafftrack_url(@coursestafftrack)
    assert_response :success
  end

  test "should update coursestafftrack" do
    patch coursestafftrack_url(@coursestafftrack), params: { coursestafftrack: {  } }
    assert_redirected_to coursestafftrack_url(@coursestafftrack)
  end

  test "should destroy coursestafftrack" do
    assert_difference('Coursestafftrack.count', -1) do
      delete coursestafftrack_url(@coursestafftrack)
    end

    assert_redirected_to coursestafftracks_url
  end
end
