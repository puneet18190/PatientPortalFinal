class TemperaturesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_temperature, only: [:show, :edit, :update, :destroy]

  # GET /temperatures
  # GET /temperatures.json
  def index
    @temperatures = current_user.temperatures.page(params[:page]).per(3)
  end

  # GET /temperatures/1
  # GET /temperatures/1.json
  def show
    @temperatures = Temperature.find_by(user_id: current_user.id) if current_user
  end

  # GET /temperatures/new
  def new
    @temperature = current_user.temperatures.build
  end

  # GET /temperatures/1/edit
  def edit
  end

  # POST /temperatures
  # POST /temperatures.json
  def create
    @temperature = current_user.temperatures.build(temperature_params)

    respond_to do |format|
      if @temperature.save
        format.html { redirect_to @temperature, notice: 'Temperature Record Created.' }
        format.json { render :show, status: :created, location: @temperature }
      else
        format.html { render :new }
        format.json { render json: @temperature.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /temperatures/1
  # PATCH/PUT /temperatures/1.json
  def update
    respond_to do |format|
      if @temperature.update(temperature_params)
        format.html { redirect_to @temperature, notice: 'Temperature Record Updated.' }
        format.json { render :show, status: :ok, location: @temperature }
      else
        format.html { render :edit }
        format.json { render json: @temperature.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /temperatures/1
  # DELETE /temperatures/1.json
  def destroy
    if current_user.id == @temperature.user.id
      @temperature.destroy
      respond_to do |format|
        format.html { redirect_to temperatures_url, notice: 'Temperature Record Deleted' }
        format.json { head :no_content }
        end
    else
    redirect_to root_path, notice: "You don't have permission."
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_temperature
      @temperature = Temperature.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def temperature_params
      params.require(:temperature).permit(:date, :temperature, :measured)
    end
end
