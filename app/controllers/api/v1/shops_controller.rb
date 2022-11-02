class Api::V1::ShopsController < ApiController 
  def index
    shops = Shop.all
    render json: shops
  end

  def show
    render json: Shop.find(params[:id]), serializer: ShopShowSerializer
  end
end