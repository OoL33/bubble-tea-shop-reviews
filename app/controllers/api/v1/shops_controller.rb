class Api::V1::ShopsController < ApiController 
  before_action :authorize_admin, only: [:create]

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

  def authorize_admin
    if !user_signed_in? && !(current_user.role == "admin")
      render json: {error: ["Only admins have access to this page."]}
    end
  end

  def authenticate_user
    if !user_signed_in?
      render json: {error: ["You need to be signed in first."]}
    end
  end
end