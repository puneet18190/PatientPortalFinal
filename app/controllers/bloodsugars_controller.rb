class BloodsugarsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_bloodsugar, only: [:show, :edit, :update, :destroy]

  # GET /bloodsugars
  # GET /bloodsugars.json
  def index
    @bloodsugars = current_user.bloodsugars.page(params[:page]).per(3)
  end

  # GET /bloodsugars/1
  # GET /bloodsugars/1.json
  def show
    @bloodsugars = Bloodsugar.find_by(user_id: current_user.id) if current_user
  end

  # GET /bloodsugars/new
  def new
    @bloodsugar = current_user.bloodsugars.build
  end

  # GET /bloodsugars/1/edit
  def edit
  end

  # POST /bloodsugars
  # POST /bloodsugars.json
  def create
    @bloodsugar = current_user.bloodsugars.build(bloodsugar_params)

    respond_to do |format|
      if @bloodsugar.save
        format.html { redirect_to @bloodsugar, notice: 'Bloodsugar Record Created' }
        format.json { render :show, status: :created, location: @bloodsugar }
      else
        format.html { render :new }
        format.json { render json: @bloodsugar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bloodsugars/1
  # PATCH/PUT /bloodsugars/1.json
  def update
    respond_to do |format|
      if @bloodsugar.update(bloodsugar_params)
        format.html { redirect_to @bloodsugar, notice: 'Bloodsugar Record Updated' }
        format.json { render :show, status: :ok, location: @bloodsugar }
      else
        format.html { render :edit }
        format.json { render json: @bloodsugar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bloodsugars/1
  # DELETE /bloodsugars/1.json
  def destroy
    if current_user.id == @bloodsugar.user.id
      @bloodsugar.destroy
      respond_to do |format|
        format.html { redirect_to bloodsugars_url, notice: 'Bloodsugar Record Deleted' }
        format.json { head :no_content }
        end
    else
    redirect_to root_path, notice: "You don't have permission."
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bloodsugar
      @bloodsugar = Bloodsugar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bloodsugar_params
      params.require(:bloodsugar).permit(:date, :fasting, :nonfasting, :unit)
    end
end
