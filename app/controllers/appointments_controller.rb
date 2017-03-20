class AppointmentsController < ApplicationController
   before_action :authenticate_user!

	def preload
		practice = Practice.find(params[:practice_id])
		today = Date.today
		appointments = practice.appointments.where("date >= ? ", today)

		render json: appointments
	end
	
	def your_trips
		@trips = current_user.appointments
	end

	def create
		@appointment = current_user.appointments.create(appointment_params)

		redirect_to @appointment.practice, notice: "Your appointment has been created..."
	end

	private
		def appointment_params
			params.require(:reservation).permit(:date, :time, :price, :total, :practice_id)
		end
end