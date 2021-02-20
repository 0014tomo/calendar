class SessionsController < ApplicationController
  def new
  end

  def create
    room = Room.find_by(password: params[:session][:password], room_name: params[:session][:room_name]) 
    if room
      session[:room_id] = room.id
      redirect_to root_path
    else
      flash.now[:alert] = "ルーム名、またはパスワードが違います。"
      render :new
    end
  end

  def destroy
    session[:room_id] = nil
    @current_room = nil
    redirect_to root_path
  end
end
