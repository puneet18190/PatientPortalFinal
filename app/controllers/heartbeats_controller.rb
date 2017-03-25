class HeartbeatsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_heartbeat, only: [:show, :edit, :update, :destroy]

  # GET /heartbeats
  # GET /heartbeats.json
  def index
    @heartbeats = Heartbeat.all.page(params[:page]).per(3)
  end

  # GET /heartbeats/1
  # GET /heartbeats/1.json
  def show
  end

  # GET /heartbeats/new
  def new
    @heartbeat = Heartbeat.new
  end

  # GET /heartbeats/1/edit
  def edit
  end

  # POST /heartbeats
  # POST /heartbeats.json
  def create
    @heartbeat = Heartbeat.new(heartbeat_params)

    respond_to do |format|
      if @heartbeat.save
        format.html { redirect_to @heartbeat, notice: 'Heartbeat was successfully created.' }
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
        format.html { redirect_to @heartbeat, notice: 'Heartbeat was successfully updated.' }
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
    @heartbeat.destroy
    respond_to do |format|
      format.html { redirect_to heartbeats_url, notice: 'Heartbeat was successfully destroyed.' }
      format.json { head :no_content }
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
