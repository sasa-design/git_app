class Api::RoomsController < ApplicationController
    before_action :authenticate, only: [:create,:update,:destroy]
    def index
        rooms = Room.where(user_id: current_user.id)
        render json: rooms, each_serializer: RoomSerializer
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

    def room_params
        params.fetch(:room,{}).permit(
            :area, :genre, :artist, :date, :time, :comment
        ).merge(
            user_id: current_user.id
        )
    end
end
