class Api::V1::ShopsController < ApiController 
  def index
    render json: { shops: Shop.all }
  end

  def show
    render json: { shop: Shop.find(params[:id]) }
  end
end