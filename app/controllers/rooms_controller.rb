class RoomsController < ApplicationController

    def new
        @room = Room.new
    end
    
    def create
        @room = Room.new(room_name: params[:room][:room_name], password: params[:room][:password])
        @room.user_id = current_user.id
        @room.save
        redirect_to root_path
    end
    
    def destroy
        room = Room.find_by(id: session[:room_id])
        room.destroy
        session[:room_id] = nil
        @current_room = nil
        flash[:notice] = "ルームを削除しました。"
        redirect_to root_path
        
    end
    
    def index
    end
end
