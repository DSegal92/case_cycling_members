require 'test_helper'

class SponsorshipOffersControllerTest < ActionController::TestCase
  setup do
    #TODO verify user has correct permissions to create sponsorship offer
    @sponsorship_offer = sponsorship_offers(:one)
  end

  test "should get index" do
    get :index
    assert_response 302
    assert_not_nil assigns(:sponsorship_offers)
  end

  test "should get new" do
    get :new
    assert_response 302
  end

  test "should create sponsorship_offer" do
    assert_difference('SponsorshipOffer.count') do
      post :create, sponsorship_offer: { description: @sponsorship_offer.description, name: @sponsorship_offer.name }
    end

    assert_redirected_to sponsorship_offer_path(assigns(:sponsorship_offer))
  end

  test "should show sponsorship_offer" do
    get :show, id: @sponsorship_offer
    assert_response 302
  end

  test "should get edit" do
    get :edit, id: @sponsorship_offer
    assert_response 302
  end

  test "should update sponsorship_offer" do
    put :update, id: @sponsorship_offer, sponsorship_offer: { description: @sponsorship_offer.description, name: @sponsorship_offer.name }
    assert_redirected_to sponsorship_offer_path(assigns(:sponsorship_offer))
  end

  test "should destroy sponsorship_offer" do
    assert_difference('SponsorshipOffer.count', -1) do
      delete :destroy, id: @sponsorship_offer
    end

    assert_redirected_to sponsorship_offers_path
  end
end
