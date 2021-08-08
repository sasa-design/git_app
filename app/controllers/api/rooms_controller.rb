class Api::RoomsController < ApplicationController
    def index
        rooms = Room.where(user_id: userId_params[:userId])
        page = params[:page] || 1
        per = params[:per] || 10
        @rooms = rooms.page(page).per(per)
        response = {
            rooms: @rooms.select(:id, :area, :genre, :artist, :date, :time),
        }
        render json: response
    end

    def show
        room = Room.find(params[:id])
        render json: room, serializer: RoomSerializer
    end

    def create
        room = Room.new(room_params)
        if room.save
            render json: room, serializer: RoomSerializer
        else
            render json: room.errors, status: :unprocessable_entity
        end
    end

    def update
        room = Room.find(params[:id])
        room.update(room_params)
        render json: room, serializer: RoomSerializer
    end

    def destroy
        room = Room.find(params[:id])
        if room.destroy
            render json: room, serializer: RoomSerializer
        else
            render json: room.errors, status: :unprocessable_entity
        end
    end

    private
    def userId_params
        params.require(:q).permit(:userId)
    end

    def room_params
        params.fetch(:room,{}).permit(
            :area, :genre, :artist, :date, :time, :comment
        ).merge(
            user_id: current_user.id
        )
    end
end
