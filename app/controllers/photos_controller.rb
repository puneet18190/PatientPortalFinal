class PhotosController < ApplicationController

	def destroy
		@photo = Photo.find(params[:id])
		practice = @photo.practice

		@photo.destroy
		@photos = Photo.where(practice_id: practice.id)

		respond_to :js
	end
end