class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :config_permitted_parameters, if: :devise_controller? 
  helper_method :users
  
  def users
    return User.all
  end
  
  
  private
  def config_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys:[:name, :email, :password])
      devise_parameter_sanitizer.permit(:sign_in, keys:[:name, :email, :password])
      devise_parameter_sanitizer.permit(:account_update, keys:[:name, :coment, :email, :password])
  end
end
