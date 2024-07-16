class WorkoutSessionsController < ApplicationController
  before_action :set_workout_session, only: %i[ show update destroy ]

  # GET /workout_sessions
  def index
    if params[:coach_id] && params[:workout_id]
      @workout_sessions = WorkoutSession.includes(:member).where(coach_id: params[:coach_id], workout_id: params[:workout_id])
    else
      @workout_sessions = WorkoutSession.includes(:member).all
    end

    members = @workout_sessions.map(&:member).uniq

    render json: members
    # render json: @workout_sessions.to_json(include: :member)
  end


  # GET /workout_sessions/1
  def show
    render json: @workout_session
  end

  # POST /workout_sessions
  def create
    @workout_session = WorkoutSession.new(workout_session_params)

    if @workout_session.save
      render json: @workout_session, status: :created, location: @workout_session
    else
      render json: @workout_session.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /workout_sessions/1
  def update
    if @workout_session.update(workout_session_params)
      render json: @workout_session
    else
      render json: @workout_session.errors, status: :unprocessable_entity
    end
  end

  # DELETE /workout_sessions/1
  def destroy
    @workout_session.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workout_session
      @workout_session = WorkoutSession.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def workout_session_params
      params.require(:workout_session).permit(:workout_id, :member_id, :coach_id)
    end
end
