class WorkoutItemsController < ApplicationController
  before_action :set_workout_item, only: %i[ show edit update destroy ]

  # GET /workout_items or /workout_items.json
  def index
    @workout_items = WorkoutItem.all
  end

  # GET /workout_items/1 or /workout_items/1.json
  def show
  end

  # GET /workout_items/new
  def new
    @workout_item = WorkoutItem.new
  end

  # GET /workout_items/1/edit
  def edit
  end

  # POST /workout_items or /workout_items.json
  def create
    @workout_item = WorkoutItem.new(workout_item_params)

    respond_to do |format|
      if @workout_item.save
        format.html { redirect_to @workout_item, notice: "Workout item was successfully created." }
        format.json { render :show, status: :created, location: @workout_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @workout_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workout_items/1 or /workout_items/1.json
  def update
    respond_to do |format|
      if @workout_item.update(workout_item_params)
        format.html { redirect_to @workout_item, notice: "Workout item was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @workout_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @workout_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workout_items/1 or /workout_items/1.json
  def destroy
    @workout_item.destroy!

    respond_to do |format|
      format.html { redirect_to workout_items_path, notice: "Workout item was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workout_item
      @workout_item = WorkoutItem.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def workout_item_params
      params.expect(workout_item: [ :comment, :workout_id, :exercise_id ])
    end
end
