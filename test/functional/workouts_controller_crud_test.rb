require 'test_helper'

class WorkoutsControllerCRUDTest < ActionController::TestCase
	setup do
		# set the controller we're testing since it can't be infferred from the class name
		@controller = WorkoutsController.new
		
		# this is a hacky way to force a log-in
		@member = members(:admin)
		session[:member_id] = @member
		
		# this is our test object from a fixture
		@workout = workouts(:one)
	end

	test "create workout" do
		# make sure the object was created
		assert_difference('Workout.count', 1, 'Workout should be added') do
			post :create, workout: { date: @workout.date, description: @workout.description }
		end
		
		# we get redirected to the list page upon success, the root on failure
		assert_redirected_to workouts_url
	end
	
	test "edit workout" do
		# generate expected values randomly
		@date = DateTime.civil_from_format :utc, 2000 + rand(999), rand(12), rand(20), rand(12), rand(59), rand(59)
		@desc = (0...200).map{ (' '..'~').to_a[rand(94)] }.join
		
		# update the existing entry
		put :update, id: @workout, workout: { date: @date, description: @desc }
		
		# we get redirected to the list page upon success, the root on failure
		assert_redirected_to workouts_url
		
		# make sure everything updated as expected
		@test_workout = Workout.find(@workout)
		assert_equal(@date, @test_workout.date, "Dates should match")
		assert_equal(@desc, @test_workout.description, "Descriptions should match")
	end
	
	test "destroy workout" do
		# make sure the object was removed
		assert_difference('Workout.count', -1, 'Workout should be destroyed') do
			delete :destroy, id: @workout
		end
		
		# we get redirected to the list page upon success, the root on failure
		assert_redirected_to workouts_url
	end
end
