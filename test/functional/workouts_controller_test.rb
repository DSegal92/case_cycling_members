require 'test_helper'

class WorkoutsControllerTest < ActionController::TestCase
  setup do
    #TODO verify user has correct permissions to create workout
    @workout = workouts(:one)
  end

  test "should get index not current user" do
    get :index
    assert_response 302
    assert_nil assigns(:workouts)
  end

  test "should get new" do
    get :new
    assert_response 302
  end

  test "should create workout no permissions" do
    assert_no_difference('Workout.count') do
      post :create, workout: { date: @workout.date, description: @workout.description }
    end

    assert_redirected_to root_url
  end

#  test "should create workout no permissions" do
#    assert_no_difference('Workout.count') do
#      post :create, workout: { date: @workout.date, description: @workout.description }
#    end

#    assert_redirected_to workout_path(assigns(:workout))
#  end

  test "should get edit" do
    get :edit, id: @workout
    assert_response 302
  end

  test "should update workout no permissions" do
    put :update, id: @workout, workout: { date: @workout.date, description: @workout.description }
    assert_redirected_to root_url
  end

  test "should destroy workout no permissions" do
    assert_no_difference('Workout.count') do
      delete :destroy, id: @workout
    end

    assert_redirected_to root_url
  end
end
