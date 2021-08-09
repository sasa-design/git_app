class Api::RoomsController < ApplicationController
    def index
        rooms = Room.where(user_id: index_params[:userId])
        page = index_params[:page] || 1
        per = index_params[:per] || 10
        @rooms = rooms.page(page).per(per)
        response = {
            rooms: @rooms.select(:id, :genre, :artist, :area, :date, :time, :comment),
        }
        render json: response
    end

    def show
        room = Room.find(params[:id])
        render json: room, serializer: RoomSerializer
    end

    def create
        room = Room.create(room_params)
    end

    def update
        room = Room.find(params[:id])
        if room.update(room_params)
            render json: room, serializer: RoomSerializer
        else 
            render json: room.errors, status: :unprocessable_entity
        end
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
    def index_params
        params.require(:q).permit(:userId, :page, :per)
    end

    def room_params
        params.require(:room).permit(
            :area, :genre, :artist, :date, :time, :comment,:user_id
        )
    end
end
