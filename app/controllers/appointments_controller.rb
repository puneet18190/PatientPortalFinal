class AppointmentsController < ApplicationController
   before_action :authenticate_user!, except: [:notify]
   
   

	def preload
		practice = Practice.find(params[:practice_id])
		today = Date.today
		appointments = practice.appointments.where("date >= ?", today)

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
				amount: @appointment.price,
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

	def check_date_time
		if params[:time].blank? || params[:date].blank?
			render json: {status: true}
		else
			arr = []
			arr1 = []
			Appointment.all.map{|a| arr << "#{a.date} #{a.time.strftime("%T") }" unless a.time.nil? }
			arr.map{|a| arr1 << DateTime.parse(a).to_i }
			d = DateTime.parse("#{params[:date]} #{params[:time]}").to_i
			if arr1.include?(d)
				render json: {status: false}
			else
				render json: {status: true}
			end
		end
	end
	
	private
		
		
		def appointment_params
			params.require(:appointment).permit(:date, :hour, :price, :reason, :practice_id, :time)
		end
end