require 'test_helper'

class DocumentsControllerCRUDTest < ActionController::TestCase
	setup do
		# set the controller we're testing since it can't be infferred from the class name
		@controller = DocumentsController.new
		
		# this is a hacky way to force a log-in
		@member = members(:admin)
		session[:member_id] = @member
		
		# this is our test object from a fixture
		@document = documents(:one)
	end

	test "create blog" do
		# make sure the object was created
		assert_difference('Document.count', 1, 'Document should be added') do
			post :create, document: { name: @document.name, url: @document.url, description: @document.description }
		end
		
		# we get redirected to the list page upon success, the root on failure
		assert_redirected_to documents_url
	end
	
	test "edit blog" do
		# generate expected values randomly
		@name = (0...50).map{ (' '..'~').to_a[rand(94)] }.join
		@url = (0...200).map{ (' '..'~').to_a[rand(94)] }.join
		@desc = (0...200).map{ (' '..'~').to_a[rand(94)] }.join
		
		# update the existing entry
		put :update, id: @document, document: { name: @name, url: @url, description: @desc }
		
		# we get redirected to the list page upon success, the root on failure
		assert_redirected_to documents_url
		
		# make sure everything updated as expected
		@test_obj = Document.find(@document)
		assert_equal(@name, @test_obj.name, "Names should match")
		assert_equal(@url, @test_obj.url, "URLs should match")
		assert_equal(@desc, @test_obj.description, "Descriptions should match")
	end
	
	test "destroy blog" do
		# make sure the object was removed
		assert_difference('Document.count', -1, 'Document should be destroyed') do
			delete :destroy, id: @document
		end
		
		# we get redirected to the list page upon success, the root on failure
		assert_redirected_to documents_url
	end
end
