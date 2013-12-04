require 'test_helper'

class BlogsControllerCRUDTest < ActionController::TestCase
	setup do
		# set the controller we're testing since it can't be infferred from the class name
		@controller = BlogsController.new
		
		# this is a hacky way to force a log-in
		@member = members(:admin)
		session[:member_id] = @member
		
		# this is our test object from a fixture
		@blog = blogs(:one)
	end

#	test "create blog" do
#		# make sure the object was created
#		assert_difference('Blog.count', 1, 'Blog should be added') do
#			post :create, blog: { title: @blog.title, contents: @blog.contents }
#		end
#		
#		# we get redirected to the list page upon success, the root on failure
#		assert_redirected_to blogs_url
#	end
	
#	test "edit blog" do
#		# generate expected values randomly
#		@title = (0...50).map{ (' '..'~').to_a[rand(94)] }.join
#		@contents = (0...200).map{ (' '..'~').to_a[rand(94)] }.join
#		
#		# update the existing entry
#		put :update, id: @blog, blog: { title: @title, contents: @contents }
#		
#		# we get redirected to the list page upon success, the root on failure
#		assert_redirected_to blogs_url
#		
#		# make sure everything updated as expected
#		@test_blog = Blog.find(@blog)
#		assert_equal(@title, @test_blog.title, "Titles should match")
#		assert_equal(@contents, @test_blog.contents, "Contents should match")
#	end
	
	test "destroy blog" do
		# make sure the object was removed
		assert_difference('Blog.count', -1, 'Blog should be destroyed') do
			delete :destroy, id: @blog
		end
		
		# we get redirected to the list page upon success, the root on failure
		assert_redirected_to blogs_url
	end
end
