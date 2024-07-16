require "test_helper"

class WorkoutSessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @workout_session = workout_sessions(:one)
  end

  test "should get index" do
    get workout_sessions_url, as: :json
    assert_response :success
  end

  test "should create workout_session" do
    assert_difference("WorkoutSession.count") do
      post workout_sessions_url, params: { workout_session: { coach_id: @workout_session.coach_id, member_id: @workout_session.member_id, workout_id: @workout_session.workout_id } }, as: :json
    end

    assert_response :created
  end

  test "should show workout_session" do
    get workout_session_url(@workout_session), as: :json
    assert_response :success
  end

  test "should update workout_session" do
    patch workout_session_url(@workout_session), params: { workout_session: { coach_id: @workout_session.coach_id, member_id: @workout_session.member_id, workout_id: @workout_session.workout_id } }, as: :json
    assert_response :success
  end

  test "should destroy workout_session" do
    assert_difference("WorkoutSession.count", -1) do
      delete workout_session_url(@workout_session), as: :json
    end

    assert_response :no_content
  end
end
