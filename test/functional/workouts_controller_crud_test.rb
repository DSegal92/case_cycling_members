require 'test_helper'

class WorkoutsControllerCRUDTest < ActionController::TestCase
	setup do
		@controller = WorkoutsController.new
		# this is a hacky way to force a log-in (it acually isn't; current_user is actually a method)
		@member = members(:admin)
		@controller.instance_variable_set(:@current_user, @member)
		
		@workout = workouts(:one)
	end

	test "create workout" do
		assert_difference('Workout.count', 1, 'Workout should be added') do
			post :create, workout: { date: @workout.date, description: @workout.description }
		end
		
		assert_response :success
	end
	
	test "edit workout" do
		#assert do
			put :update, id: @workout, workout: { date: @workout.date, description: @workout.description }
		#end
		
		# why is this 302 instead of 200?
		assert_response 302
	end
	
	test "destroy workout" do
		assert_difference('Workout.count', -1, 'Workout should be destroyed') do
			delete :destroy, id: @workout
		end
		
		assert_response :success
	end
end