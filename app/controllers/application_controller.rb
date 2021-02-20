class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :config_permitted_parameters, if: :devise_controller? 
  helper_method :users, :current_room, :room_in?
  
  def users
    return User.all
  end
  

  
  def current_room
    @current_room ||=  Room.find_by(id: session[:room_id])
  end
  
  def room_in?
    !@current_room.nil?
  end
  
  def authenticate_room
     if session[:room_id] == nil
       flash[:notice] = "ルームに入室してください。"
       redirect_to root_path
     end
  end
  
  private
  def config_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys:[:name, :email, :password])
      devise_parameter_sanitizer.permit(:sign_in, keys:[:name, :email, :password])
      devise_parameter_sanitizer.permit(:account_update, keys:[:name, :coment, :email, :password])
  end
end
