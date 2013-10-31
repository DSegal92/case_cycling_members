require 'test_helper'

class EquipmentControllerTest < ActionController::TestCase
  setup do
    #TODO verify user has correct permissions to create equipment
    @equipment = equipment(:one)
  end

  test "should get index not current member" do
    get :index
    assert_response 302
    assert_nil assigns(:equipment)
  end

  test "should get new" do
    get :new
    assert_response 302
  end

  test "should create equipment no permissions" do
    assert_no_difference('Equipment.count') do
      post :create, equipment: { name: @equipment.name, quantity: @equipment.quantity }
    end

    assert_redirected_to root_url
  end

   # test "should create equipment" do
    #assert_difference('Equipment.count') do
     # post :create, equipment: { name: @equipment.name, quantity: @equipment.quantity }
    #end

    #assert_redirected_to equipment_path(assigns(:equipment))
  #end

  test "should get edit" do
    get :edit, id: @equipment
    assert_response 302
  end

  test "should update equipment no permissions" do
    put :update, id: @equipment, equipment: { name: @equipment.name, quantity: @equipment.quantity }
    assert_redirected_to root_url
  end

  test "should destroy equipment no permissions" do
    assert_no_difference('Equipment.count') do
      delete :destroy, id: @equipment
    end

    assert_redirected_to root_url
  end
end
