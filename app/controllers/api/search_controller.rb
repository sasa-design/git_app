class Api::SearchController < ApplicationController
    def index
        rooms = Room.where.not(user_id: search_params[:userId])
        page = index_params[:page] || 1
        per = index_params[:per] || 10
        @rooms = rooms.page(page).per(per)
        response = {
            rooms: @rooms.select(:id, :genre, :artist, :area, :date, :time, :comment),
        }
        render json: response
    end

    private 
    def search_params
        params.require(:q).permit(:userId, :page, :per)
    end
end
