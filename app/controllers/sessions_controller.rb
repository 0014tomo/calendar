class SessionsController < ApplicationController
  def new
  end

  def create
    room = Room.find_by(password: params[:session][:password]) 
    if room.room_name ==  params[:session][:room_name]
      session[:room_id] = room.id
      redirect_to root_path
    end
  end

  def destroy
    session[:room_id] = nil
    @current_room = nil
    redirect_to root_path
  end
end
