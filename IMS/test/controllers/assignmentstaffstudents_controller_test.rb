require 'test_helper'

class AssignmentstaffstudentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @assignmentstaffstudent = assignmentstaffstudents(:one)
  end

  test "should get index" do
    get assignmentstaffstudents_url
    assert_response :success
  end

  test "should get new" do
    get new_assignmentstaffstudent_url
    assert_response :success
  end

  test "should create assignmentstaffstudent" do
    assert_difference('Assignmentstaffstudent.count') do
      post assignmentstaffstudents_url, params: { assignmentstaffstudent: {  } }
    end

    assert_redirected_to assignmentstaffstudent_url(Assignmentstaffstudent.last)
  end

  test "should show assignmentstaffstudent" do
    get assignmentstaffstudent_url(@assignmentstaffstudent)
    assert_response :success
  end

  test "should get edit" do
    get edit_assignmentstaffstudent_url(@assignmentstaffstudent)
    assert_response :success
  end

  test "should update assignmentstaffstudent" do
    patch assignmentstaffstudent_url(@assignmentstaffstudent), params: { assignmentstaffstudent: {  } }
    assert_redirected_to assignmentstaffstudent_url(@assignmentstaffstudent)
  end

  test "should destroy assignmentstaffstudent" do
    assert_difference('Assignmentstaffstudent.count', -1) do
      delete assignmentstaffstudent_url(@assignmentstaffstudent)
    end

    assert_redirected_to assignmentstaffstudents_url
  end
end
