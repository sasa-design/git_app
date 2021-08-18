class Api::SearchController < ApplicationController
    def index
        rooms = Room.where.not(user_id: search_params[:userId])
        rooms_search = rooms.ransack(search_params[:search]).result
        page = search_params[:page] || 1
        per = search_params[:per] || 10
        @rooms = rooms_search.page(page).per(per)
        render json: @rooms ,each_serializer: RoomSerializer
    end

    private 
    def search_params
        params.require(:q).permit(:userId, :page, :per,:search)
    end
end
