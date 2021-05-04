class Api::SearchController < ApplicationController
    def index
        rooms = Room.ransack(search_params).result
        render json: rooms, each_serializer: RoomSerializer
    end

    private 
    def search_params
        params.require(:q).permit(:area_eq,:genre_eq,:artist_cont,:date_eq,:time_start)
    end
end
