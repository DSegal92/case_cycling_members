require 'test_helper'

class EquipmentControllerTest < ActionController::TestCase
  setup do
    #TODO verify user has correct permissions to create equipment
    @equipment = equipment(:one)
  end

  test "should get index" do
    get :index
    assert_response 302
    assert_not_nil assigns(:equipment)
  end

  test "should get new" do
    get :new
    assert_response 302
  end

  test "should create equipment" do
    assert_difference('Equipment.count') do
      post :create, equipment: { name: @equipment.name, quantity: @equipment.quantity }
    end

    assert_redirected_to equipment_path(assigns(:equipment))
  end

  test "should show equipment" do
    get :show, id: @equipment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @equipment
    assert_response 302
  end

  test "should update equipment" do
    put :update, id: @equipment, equipment: { name: @equipment.name, quantity: @equipment.quantity }
    assert_redirected_to equipment_path(assigns(:equipment))
  end

  test "should destroy equipment" do
    assert_difference('Equipment.count', -1) do
      delete :destroy, id: @equipment
    end

    assert_redirected_to equipment_index_path
  end
end
