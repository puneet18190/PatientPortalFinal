class ReviewsController < ApplicationController

	def create
		@review = current_user.reviews.create(review_params)
		redirect_to @review.practice
	end

	def destroy
		@review = Review.find(params[:id])
		practice = @review.practice
		@review.destroy

		redirect_to practice
	end

	private
		def review_params
			params.require(:review).permit(:comment, :star, :practice_id)
		end
end