require 'test_helper'

class ClothingItemsControllerCRUDTest < ActionController::TestCase
	setup do
		# set the controller we're testing since it can't be infferred from the class name
		@controller = ClothingItemsController.new
		
		# this is a hacky way to force a log-in
		@member = members(:admin)
		session[:member_id] = @member
		
		# this is our test object from a fixture
		@clothes = clothing_items(:one)
	end

	test "create blog" do
		# make sure the object was created
		assert_difference('ClothingItem.count', 1, 'Clothing item should be added') do
			post :create, clothing_item: { name: @clothes.name, picture_url: @clothes.picture_url }
		end
		
		# we get redirected to the list page upon success, the root on failure
		assert_redirected_to clothing_items_url
	end
	
	test "edit blog" do
		# generate expected values randomly
		@name = (0...50).map{ (' '..'~').to_a[rand(94)] }.join
		@url = (0...200).map{ (' '..'~').to_a[rand(94)] }.join
		
		# update the existing entry
		put :update, id: @clothes, clothing_item: { name: @name, picture_url: @url }
		
		# we get redirected to the list page upon success, the root on failure
		assert_redirected_to clothing_items_url
		
		# make sure everything updated as expected
		@test_obj = ClothingItem.find(@clothes)
		assert_equal(@name, @test_obj.name, "Names should match")
		assert_equal(@url, @test_obj.picture_url, "URLs should match")
	end
	
	test "destroy blog" do
		# make sure the object was removed
		assert_difference('ClothingItem.count', -1, 'Clothing item should be destroyed') do
			delete :destroy, id: @clothes
		end
		
		# we get redirected to the list page upon success, the root on failure
		assert_redirected_to clothing_items_url
	end
end
