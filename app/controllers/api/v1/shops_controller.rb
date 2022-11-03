class Api::V1::ShopsController < ApiController 
  def index
    render json: Shop.all
  end

  def show
    render json: Shop.find(params[:id]), serializer: ShopShowSerializer, include: ['reviews.user']
  end

  def create
    shop = Shop.new(shop_params)

    if shop.save
      render json: { shop: shop }
    else
      render json: { error: shop.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :address, :city, :state, :zip)
  end
end