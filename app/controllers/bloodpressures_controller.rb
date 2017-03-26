class BloodpressuresController < ApplicationController
  before_action :authenticate_user!
  before_action :set_bloodpressure, only: [:show, :edit, :update, :destroy]

  # GET /bloodpressures
  # GET /bloodpressures.json
  def index
    @bloodpressures = current_user.bloodpressures.page(params[:page]).per(3)
  end

  # GET /bloodpressures/1
  # GET /bloodpressures/1.json
  def show
    @bloodpressures = Bloodpressure.find_by(user_id: current_user.id) if current_user
  end

  # GET /bloodpressures/new
  def new
    @bloodpressure = current_user.bloodpressures.build
  end

  # GET /bloodpressures/1/edit
  def edit
  end

  # POST /bloodpressures
  # POST /bloodpressures.json
  def create
    @bloodpressure = current_user.bloodpressures.build(bloodpressure_params)

    respond_to do |format|
      if @bloodpressure.save
        format.html { redirect_to @bloodpressure, notice: 'Bloodpressure Record Created' }
        format.json { render :show, status: :created, location: @bloodpressure }
      else
        format.html { render :new }
        format.json { render json: @bloodpressure.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bloodpressures/1
  # PATCH/PUT /bloodpressures/1.json
  def update
    respond_to do |format|
      if @bloodpressure.update(bloodpressure_params)
        format.html { redirect_to @bloodpressure, notice: 'Bloodpressure Record Updated.' }
        format.json { render :show, status: :ok, location: @bloodpressure }
      else
        format.html { render :edit }
        format.json { render json: @bloodpressure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bloodpressures/1
  # DELETE /bloodpressures/1.json
  def destroy
    if current_user.id == @bloodpressure.user.id
      @bloodpressure.destroy
      respond_to do |format|
        format.html { redirect_to bloodpressures_url, notice: 'Bloodpressure Record Deleted' }
        format.json { head :no_content }
        end
    else
    redirect_to root_path, notice: "You don't have permission."
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bloodpressure
      @bloodpressure = Bloodpressure.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bloodpressure_params
      params.require(:bloodpressure).permit(:date, :systolic, :dystolic, :measuredd)
    end
end
