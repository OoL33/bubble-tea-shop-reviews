class Api::V1::ReviewsController < ApiController

	def create

		review = Review.new(review_params)
		shop_id = params[:shop_id]
		shop = Shop.find(shop_id)
		review.shop = shop
		user = current_user
		review.user = user


		# review.shop =  Shop.find(params[:shop_id])

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
