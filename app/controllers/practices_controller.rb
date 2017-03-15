class PracticesController < ApplicationController
  before_action :set_practice,only:[:show,:edit,:update]
  before_action :authenticate_user!,except: [:show]
  def index
    @practices = current_user.practices
  end

  def show
    
  end

  def new
    @practice = current_user.practices.build
  end

  def create
    @practice = current_user.practices.build
    
    if @practice.save
      redirect_to @practice,notice:"Saved..."
    else
      render :new
    end
  end

  def edit
   
  end

  def update
    if @practice.update(practice_params)
      redirect_to @practice,notice:"Updated..."
    else
      render :edit
    end
  end
  
  private
  def set_practice
    @practice = Practice.find(params[:id])
  end
  
  def practice_params
    params.require(:practice).permit(:dr_first_name,:dr_last_name,:experience,:speciality,:address,:professional_statement,:is_insurance,:insurance,:zip_code)
  end
end

