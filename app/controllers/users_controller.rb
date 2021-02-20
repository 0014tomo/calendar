class UsersController < ApplicationController
  helper_method :room_user
  before_action :authenticate_room
  
  def index
    @customers = Customer.where(room_id: session[:room_id])
    @users_id = @customers.distinct.pluck(:user_id)
  end
end
