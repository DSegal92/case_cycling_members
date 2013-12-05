require 'test_helper'

class DocumentsControllerTest < ActionController::TestCase
  setup do
    #TODO verify user has correct permissions to create document
    @document = documents(:one)
  end

  test "should get index not current user" do
    get :index
    assert_response 302
    assert_nil assigns(:documents)
  end

  test "should get new" do
    get :new
    assert_response 302
  end

  test "should create document no permissions" do
    assert_no_difference('Document.count') do
      post :create, document: { description: @document.description, name: @document.name, url: @document.url }
    end

    assert_redirected_to root_url
  end

  test "should get edit" do
    get :edit, id: @document
    assert_response 302
  end

  test "should update document no permissions" do
    put :update, id: @document, document: { description: @document.description, name: @document.name, url: @document.url }
    assert_redirected_to root_url
  end

  test "should destroy document no permissions" do
    assert_no_difference('Document.count') do
      delete :destroy, id: @document
    end

    assert_redirected_to root_url
  end
end
