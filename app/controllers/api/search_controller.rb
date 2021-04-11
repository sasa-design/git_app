class Api::SearchController < ApplicationController
    def index
        @q = Room.ransack(search_params)
        @rooms = @q.result
        render 'index',formats: :json , handlers: 'jbuilder'
    end

    private 
    def search_params
        params.require(:q).permit(:area_eq,:genre_eq,:artist_cont,:date_eq,:time_start)
    end
end
