class Api::V1::ShopsController < ApiController 
  def index
    render json: Shop.all
  end

  def show
    render json: Shop.find(params[:id]), serializer: ShopShowSerializer
  end
end