class FoodEntriesController < ApplicationController
  before_action :set_food_entry, only: %i[ show edit update destroy ]

  # GET /food_entries or /food_entries.json
  def index
    @food_entries = current_user.food_entries.order(date_eaten: :desc)
  end

  # GET /food_entries/1 or /food_entries/1.json
  def show
  end

  # GET /food_entries/new
  def new
  @food_entry = FoodEntry.new
  # Создаем "болванку" продукта, чтобы в форме появились поля для него
  @food_entry.build_product 
end


  # GET /food_entries/1/edit
  def edit
  end

  # POST /food_entries or /food_entries.json
  def create
    @food_entry = current_user.food_entries.build(food_entry_params)

    respond_to do |format|
      if @food_entry.save
        format.html { redirect_to @food_entry, notice: "Запись о приёме пищи успешно создана." }
        format.json { render :show, status: :created, location: @food_entry }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @food_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /food_entries/1 or /food_entries/1.json
  def update
    respond_to do |format|
      if @food_entry.update(food_entry_params)
        format.html { redirect_to @food_entry, notice: "Информация о приёме пищи успешно обновлена..", status: :see_other }
        format.json { render :show, status: :ok, location: @food_entry }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @food_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /food_entries/1 or /food_entries/1.json
  def destroy
    @food_entry.destroy!

    respond_to do |format|
      format.html { redirect_to food_entries_path, notice: "Запись о приёме пищи успешно удалена.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food_entry
      @food_entry = FoodEntry.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def food_entry_params
      params.require(:food_entry).permit(
        :weight_grams, 
        :date_eaten, 
        :meal_type_id, 
        # Разрешаем вложенные поля для продукта:
        product_attributes: [:name, :calories, :proteins, :fats, :carbs, :food_category_id]
      )
    end
end
