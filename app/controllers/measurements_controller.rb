class MeasurementsController < ApplicationController
  before_action :set_measurement, only: %i[ show edit update destroy ]

  # GET /measurements
  def index
    # ПОКАЗЫВАЕМ ТОЛЬКО ЗАМЕРЫ ТЕКУЩЕГО ПОЛЬЗОВАТЕЛЯ
    # order(date_taken: :desc) сортирует от новых к старым
    @measurements = current_user.measurements.order(date_taken: :desc)
  end

  # GET /measurements/1
  def show
  end

  # GET /measurements/new
  def new
    @measurement = Measurement.new
  end

  # GET /measurements/1/edit
  def edit
  end

  # POST /measurements
  def create
    # СОЗДАЕМ ЗАМЕР ОТ ИМЕНИ ТЕКУЩЕГО ПОЛЬЗОВАТЕЛЯ
    @measurement = current_user.measurements.build(measurement_params)

    respond_to do |format|
      if @measurement.save
        format.html { redirect_to measurement_url(@measurement), notice: "Замер успешно добавлен." }
        format.json { render :show, status: :created, location: @measurement }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @measurement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /measurements/1
  def update
    respond_to do |format|
      if @measurement.update(measurement_params)
        format.html { redirect_to measurement_url(@measurement), notice: "Замер обновлен." }
        format.json { render :show, status: :ok, location: @measurement }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @measurement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /measurements/1
  def destroy
    @measurement.destroy!

    respond_to do |format|
      format.html { redirect_to measurements_url, notice: "Замер удален." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_measurement
      @measurement = Measurement.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def measurement_params
      # Убрали user_id из разрешенных параметров, так как мы задаем его сами
      params.require(:measurement).permit(:weight, :waist, :hip, :date_taken)
    end
end
