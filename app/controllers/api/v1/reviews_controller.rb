class Api::V1::ReviewsController < ApiController

	def create

		review = Review.new(review_params)
    binding.pry
		review.shop =  Shop.find(params[:shop_id])
		review.user = current_user
    binding.pry

		if review.save
			render json: { review: review }
		else
			render json: { error: review.errors.full_messages }, status: :unprocessable_entity
		end
	end

	private

	def review_params
		params.require(:review).permit(:rating, :body)
	end
end
