require 'test_helper'

class WorkoutsControllerCRUDTest < ActionController::TestCase
	setup do
		@controller = WorkoutsController.new
		# this is a hacky way to force a log-in
		@member = members(:admin)
		session[:member_id] = @member
		
		@workout = workouts(:one)
	end

	test "create workout" do
		assert_difference('Workout.count', 1, 'Workout should be added') do
			post :create, workout: { date: @workout.date, description: @workout.description }
		end
		
		# we get redirected to the list page upon success, the root on failure
		assert_redirected_to workouts_url
	end
	
	test "edit workout" do
		#assert do
			put :update, id: @workout, workout: { date: @workout.date, description: @workout.description }
		#end
		
		# we get redirected to the list page upon success, the root on failure
		assert_redirected_to workouts_url
	end
	
	test "destroy workout" do
		assert_difference('Workout.count', -1, 'Workout should be destroyed') do
			delete :destroy, id: @workout
		end
		
		# we get redirected to the list page upon success, the root on failure
		assert_redirected_to workouts_url
	end
end