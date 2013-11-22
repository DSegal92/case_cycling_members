require 'test_helper'

class RoutesRbTest < ActionController::TestCase
  test "should go to /log_in" do
  	assert_generates 'log_in', {controller: 'sessions', action: 'new'}
  end

  test "should got to /log_out" do
  	assert_generates '/log_out', {controller: 'sessions', action: 'destroy'}
  end

  test "should get /sign_up" do
  	assert_generates '/sign_up', {controller: 'members', action: 'new'}
  end

  test "should get /" do
  	assert_generates '/', {controller: 'static_pages', action: 'home'}
  end

  test "should get /members from index" do
  	assert_generates '/members', {controller: 'members', action: 'index'}
  end

  test "should get /members from create" do
  	assert_generates '/members', {controller: 'members', action: 'create'}
  end

  test "should get /members/new" do
  	assert_generates '/sign_up', {controller: 'members', action: 'new'}
  end

  test "should get /sessions from index" do
  	assert_generates '/sessions', {controller: 'sessions', action: 'index'}
  end

  test "should get /session from create" do
  	assert_generates '/sessions', {controller: 'sessions', action: 'create'}
  end

  test "should get /sessions/new" do
  	assert_generates '/log_in', {controller: 'sessions', action: 'new'}
  end

  test "should get /clothing_items from index" do
  	assert_generates '/clothing_items', {controller: 'clothing_items', action: 'index'}
  end

  test "should get /clothing_items from create" do
  	assert_generates '/clothing_items', {controller: 'clothing_items', action: 'create'}
  end

  test "should get /clothing_items/new" do
  	assert_generates '/clothing_items/new', {controller: 'clothing_items', action: 'new'}
  end

  test "should get /messages from index" do
  	assert_generates '/messages', {controller: 'messages', action: 'index'}
  end

  test "should get /messages from create" do
  	assert_generates '/messages', {controller: 'messages', action: 'create'}
  end

  test "should get /messages/new" do
  	assert_generates '/messages/new', {controller: 'messages', action: 'new'}
  end

  test "should get /events from index" do
  	assert_generates '/events', {controller: 'events', action: 'index'}
  end

  test "should get /events from create" do
  	assert_generates '/events', {controller: 'events', action: 'create'}
  end

  test "should get /events/new" do
  	assert_generates '/events/new', {controller: 'events', action: 'new'}
  end

  test "should get /documents from index" do
  	assert_generates '/documents', {controller: 'documents', action: 'index'}
  end

  test "should get /documents from create" do
  	assert_generates '/documents', {controller: 'documents', action: 'create'}
  end

  test "should get /documents/new" do
  	assert_generates '/documents/new', {controller: 'documents', action: 'new'}
  end

  test "should get /workouts from index" do
  	assert_generates '/workouts', {controller: 'workouts', action: 'index'}
  end

  test "should get /workouts from create" do
  	assert_generates '/workouts', {controller: 'workouts', action: 'create'}
  end

  test "should get /workouts/new" do
  	assert_generates '/workouts/new', {controller: 'workouts', action: 'new'}
  end

  test "should get /exercises from index" do
  	assert_generates '/exercises', {controller: 'exercises', action: 'index'}
  end

  test "should get /exercises from create" do
  	assert_generates '/exercises', {controller: 'exercises', action: 'create'}
  end

  test "should get /exercises/new" do
  	assert_generates '/exercises/new', {controller: 'exercises', action: 'new'}
  end

  test "should get /sponsorship_offers from index" do
  	assert_generates '/sponsorship_offers', {controller: 'sponsorship_offers', action: 'index'}
  end

  test "should get /sponsorship_offers from create" do
  	assert_generates '/sponsorship_offers', {controller: 'sponsorship_offers', action: 'create'}
  end

  test "should get /sponsorship_offers/new" do
  	assert_generates '/sponsorship_offers/new', {controller: 'sponsorship_offers', action: 'new'}
  end

  test "should get /sponsors from index" do
  	assert_generates '/sponsors', {controller: 'sponsors', action: 'index'}
  end

  test "should get /sponsors from create" do
  	assert_generates '/sponsors', {controller: 'sponsors', action: 'create'}
  end

  test "should get /sponsors/new" do
  	assert_generates '/sponsors/new', {controller: 'sponsors', action: 'new'}
  end

  test "should get /routes from index" do
  	assert_generates '/routes', {controller: 'routes', action: 'index'}
  end

  test "should get /routes from create" do
  	assert_generates '/routes', {controller: 'routes', action: 'create'}
  end

  test "should get /routes/new" do
  	assert_generates '/routes/new', {controller: 'routes', action: 'new'}
  end

  test "should get /rides from index" do
  	assert_generates '/rides', {controller: 'rides', action: 'index'}
  end

  test "should get /rides from create" do
  	assert_generates '/rides', {controller: 'rides', action: 'create'}
  end

  test "should get /rides/new" do
  	assert_generates '/rides/new', {controller: 'rides', action: 'new'}
  end

  test "should get /blogs from index" do
  	assert_generates '/blogs', {controller: 'blogs', action: 'index'}
  end

  test "should get /blogs from create" do
  	assert_generates '/blogs', {controller: 'blogs', action: 'create'}
  end

  test "should get /blogs/new" do
  	assert_generates '/blogs/new', {controller: 'blogs', action: 'new'}
  end

  test "should get /media from index" do
  	assert_generates '/media', {controller: 'media', action: 'index'}
  end

  test "should get /media from create" do
  	assert_generates '/media', {controller: 'media', action: 'create'}
  end

  test "should get /media/new" do
  	assert_generates '/media/new', {controller: 'media', action: 'new'}
  end

  test "should get /carousels from index" do
  	assert_generates '/carousels', {controller: 'carousels', action: 'index'}
  end

  test "should get /carousels from create" do
  	assert_generates '/carousels', {controller: 'carousels', action: 'create'}
  end

  test "should get /carousels/new" do
  	assert_generates '/carousels/new', {controller: 'carousels', action: 'new'}
  end

  test "should get /coaches from index" do
  	assert_generates '/coaches', {controller: 'coaches', action: 'index'}
  end

  test "should get /coaches from create" do
  	assert_generates '/coaches', {controller: 'coaches', action: 'create'}
  end

  test "should get /coaches/new" do
  	assert_generates '/coaches/new', {controller: 'coaches', action: 'new'}
  end

  test "should get /equipment_index from index" do
  	assert_generates '/equipment', {controller: 'equipment', action: 'index'}
  end

  test "should get /equipment_index from create" do
  	assert_generates '/equipment', {controller: 'equipment', action: 'create'}
  end

  test "should get /equipment_index/new" do
  	assert_generates '/equipment/new', {controller: 'equipment', action: 'new'}
  end

  test "should get /positions from index" do
  	assert_generates '/positions', {controller: 'positions', action: 'index'}
  end

  test "should get /positions from create" do
  	assert_generates '/positions', {controller: 'positions', action: 'create'}
  end

  test "should get /positions/new" do
  	assert_generates '/positions/new', {controller: 'positions', action: 'new'}
  end

end