class Api::V1::ReviewsController < ApiController
	def create
		review = Review.new(review_params)

		if review.save
			render json: { review: review }

		else
			render json: { error: review.errors.full_messages }, status: :unprocessable_entity
		end
	end

	private

	def review_params
		params.require(:review).permit(:rating, :body, :shop_id)
	end
end