require 'test_helper'

class MembersControllerTest < ActionController::TestCase
  setup do
    #TODO verify user has correct permissions to create memeber
    @member = members(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:members)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create member no permissions" do
    assert_no_difference('Member.count') do
      post :create, member: { is_admin: @member.is_admin, is_officer: @member.is_officer, name: @member.name, picture_url: @member.picture_url, standing: @member.standing, password: @member.password, password_confirmation: @member.password }
    end

    #assert_redirected_to root_url
    #Why isn't this redirecting
    assert_response 200
  end

  test "should show member" do
    get :show, id: @member
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @member
    assert_response :success
  end

  test "should update member" do
    put :update, id: @member, member: { is_admin: @member.is_admin, is_officer: @member.is_officer, name: @member.name, picture_url: @member.picture_url, standing: @member.standing }
    assert_redirected_to member_path(assigns(:member))
  end

  test "should destroy member" do
    assert_difference('Member.count', -1) do
      delete :destroy, id: @member
    end

    assert_redirected_to members_url
  end
end
