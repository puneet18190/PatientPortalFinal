class AppointmentsController < ApplicationController
   before_action :authenticate_user!

	def preload
		practice = Practice.find(params[:practice_id])
		today = Date.today
		appointments = practice.appointments.where("date >= ? ", today)

		render json: appointments
	end


	def create
		@appointment = current_user.appointments.create(appointment_params)

		if @appointment
			# send request to PayPal
			values = {
				business: 'shreyachakrabarti19-facilitator@gmail.com',
				cmd: '_xclick',
				upload: 1,
				notify_url: 'https://patientportalfinal-shreya19888.c9users.io/notify',
				amount: @appointment.total,
				item_name: @appointment.practice.speciality,
				item_number: @appointment.id,
				quantity: '1',
				return: 'https://patientportalfinal-shreya19888.c9users.io/your_trips'
			}

			redirect_to "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
		else
			redirect_to @appointment.practice, alert: "Oops, something went wrong..."
		end 
	end

	
	protect_from_forgery except: [:notify]
	def notify
		params.permit!
		status = params[:payment_status]

		appointment = Appointment.find(params[:item_number])

		if status == "Completed"
			appointment.update_attributes status: true
		else
			appointment.destroy
		end

		render nothing: true
	end
	
	protect_from_forgery except: [:your_trips]
	def your_trips
		@trips = current_user.appointments.where("status = ?", true)
	end
	
	def your_appointments
		@practices = current_user.practices
	end
	
	private
		def is_conflict(date)
			practice = Practice.find(params[:practice_id])

			check = practice.appointments.where("? < date ", date)
			check.size > 0? true : false
		end
		
		
		def appointment_params
			params.require(:appointment).permit(:date, :time, :price, :total, :practice_id)
		end
end