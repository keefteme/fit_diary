class WorkoutItemsController < ApplicationController
  def create
    @workout = current_user.workouts.find(params[:workout_id])
    
    @workout_item = @workout.workout_items.build(workout_item_params)

    if @workout_item.save
      redirect_to @workout, notice: "Упражнение добавлено!"
    else
      redirect_to @workout, alert: "Ошибка: выберите упражнение из списка."
    end
  end

  def destroy
    @workout_item = WorkoutItem.find(params[:id])
    
    workout = @workout_item.workout

    if workout.user == current_user
      @workout_item.destroy
      redirect_to workout, notice: "Упражнение удалено."
    else
      redirect_to root_path, alert: "Доступ запрещен."
    end
  end

  private

  def workout_item_params
    params.require(:workout_item).permit(:exercise_id, :comment)
  end
end
