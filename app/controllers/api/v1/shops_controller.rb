class Api::V1::ShopsController < ApiController 
  def show
    render json: { shop: Shop.find(params[:id]) }
  end
end