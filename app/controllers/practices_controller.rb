class PracticesController < ApplicationController
  before_action :set_practice,only:[:show,:edit,:update]
  before_action :authenticate_user!,except: [:show]
  def index
    @practices = current_user.practices
  end

  def show
    @photos = @practice.photos
    @booked = Appointment.where("practice_id = ? AND user_id = ?", @practice.id, current_user.id).present? if current_user

    @reviews = @practice.reviews
    @hasReview = @reviews.find_by(user_id: current_user.id) if current_user
  end

  def new
    @practice = current_user.practices.build
  end

  def create
     @practice = current_user.practices.build(practice_params)
     if @practice.save
       if params[:images] 
         params[:images].each do |image|
           @practice.photos.create(image: image)
           end
       end
           @photos = @practice.photos
           redirect_to edit_practice_path(@practice), notice: "Saved..."
        else
      render :new
     end
  end

  def edit
   if current_user.id == @practice.user.id
      @photos = @practice.photos
    else
      redirect_to root_path, notice: "You don't have permission."
   end
  end

  def update
    if @practice.update(practice_params)

      if params[:images] 
        params[:images].each do |image|
          @practice.photos.create(image: image)
        end
      end

      redirect_to edit_practice_path(@practice), notice: "Updated..."
    else
      render :edit
    end
  end
  
  private
  def set_practice
    @practice = Practice.find(params[:id])
  end
  
  def practice_params
    params.require(:practice).permit(:dr_first_name,:dr_last_name,:experience,:speciality,:address,:professional_statement,:is_insurance,:active,:insurance,:zip_code,:price)
  end
end
