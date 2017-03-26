class HeartbeatsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_heartbeat, only: [:show, :edit, :update, :destroy]

  # GET /heartbeats
  # GET /heartbeats.json
  def index
    @heartbeats = current_user.heartbeats.page(params[:page]).per(3)
  end

  # GET /heartbeats/1
  # GET /heartbeats/1.json
  def show
    @heartbeats = Heartbeat.find_by(user_id: current_user.id) if current_user
  end

  # GET /heartbeats/new
  def new
    @heartbeat = current_user.heartbeats.build
  end

  # GET /heartbeats/1/edit
  def edit
  end

  # POST /heartbeats
  # POST /heartbeats.json
  def create
    @heartbeat = current_user.heartbeats.build(heartbeat_params)

    respond_to do |format|
      if @heartbeat.save
        format.html { redirect_to @heartbeat, notice: 'Heartbeat Record Created' }
        format.json { render :show, status: :created, location: @heartbeat }
      else
        format.html { render :new }
        format.json { render json: @heartbeat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /heartbeats/1
  # PATCH/PUT /heartbeats/1.json
  def update
    respond_to do |format|
      if @heartbeat.update(heartbeat_params)
        format.html { redirect_to @heartbeat, notice: 'Heartbeat Record Updated' }
        format.json { render :show, status: :ok, location: @heartbeat }
      else
        format.html { render :edit }
        format.json { render json: @heartbeat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /heartbeats/1
  # DELETE /heartbeats/1.json
  def destroy
    if current_user.id == @heartbeat.user.id
      @heartbeat.destroy
      respond_to do |format|
        format.html { redirect_to heartbeats_url, notice: 'Heartbeat Record Deleted.' }
        format.json { head :no_content }
        end
    else
    redirect_to root_path, notice: "You don't have permission."
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_heartbeat
      @heartbeat = Heartbeat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def heartbeat_params
      params.require(:heartbeat).permit(:date, :count, :msr)
    end
end
