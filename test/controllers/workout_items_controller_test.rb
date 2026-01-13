require "test_helper"

class WorkoutItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @workout_item = workout_items(:one)
  end

  test "should get index" do
    get workout_items_url
    assert_response :success
  end

  test "should get new" do
    get new_workout_item_url
    assert_response :success
  end

  test "should create workout_item" do
    assert_difference("WorkoutItem.count") do
      post workout_items_url, params: { workout_item: { comment: @workout_item.comment, exercise_id: @workout_item.exercise_id, workout_id: @workout_item.workout_id } }
    end

    assert_redirected_to workout_item_url(WorkoutItem.last)
  end

  test "should show workout_item" do
    get workout_item_url(@workout_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_workout_item_url(@workout_item)
    assert_response :success
  end

  test "should update workout_item" do
    patch workout_item_url(@workout_item), params: { workout_item: { comment: @workout_item.comment, exercise_id: @workout_item.exercise_id, workout_id: @workout_item.workout_id } }
    assert_redirected_to workout_item_url(@workout_item)
  end

  test "should destroy workout_item" do
    assert_difference("WorkoutItem.count", -1) do
      delete workout_item_url(@workout_item)
    end

    assert_redirected_to workout_items_url
  end
end
