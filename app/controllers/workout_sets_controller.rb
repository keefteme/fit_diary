class WorkoutSetsController < ApplicationController
  def create
    @workout_item = WorkoutItem.find(params[:workout_item_id])
    
    # Проверка владельца тренировки
    if @workout_item.workout.user == current_user
      @set = @workout_item.workout_sets.build(set_params)
      @set.save
      redirect_to @workout_item.workout, notice: "Подход добавлен"
    end
  end

  def destroy
    @set = WorkoutSet.find(params[:id])
    workout = @set.workout_item.workout
    
    if workout.user == current_user
      @set.destroy
      redirect_to workout, notice: "Подход удален"
    end
  end

  private

  def set_params
    params.require(:workout_set).permit(:weight, :reps)
  end
end
