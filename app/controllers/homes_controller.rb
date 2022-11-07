class HomesController < ApplicationController
  before_action :authorize_admin, only: [:authorized]

  def index
  end

  def authorized
  end

  protected 

  def authorize_admin
    if !current_user
      redirect_to new_user_session_path
      flash[:alert] = "You need to be signed in first."
    elsif current_user.role != "admin"
      flash[:error] = "Only admins have access to this page."
      redirect_to shops_path
    end
  end
end
