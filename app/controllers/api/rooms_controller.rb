class Api::RoomsController < ApplicationController
    protect_from_forgery :except => [:index, :show, :create, :update, :destroy ,:search]
    def index
        @rooms = Room.all
        render 'index',formats: :json,handlers: 'jbuilder'
    end

    def show
        @room = Room.find(params[:id])
        render 'show', formats: :json, handlers: 'jbuilder'
    end

    def create
        @room = Room.new(room_params)
        if @room.save
            head :no_content
        else
            render json: @room.errors, status: :unprocessable_entity
        end
    end

    def update
        @room = Room.find(params[:id])
        if @room.update(room_params)
            render 'index', formats: :json,handlers: 'jbuilder'
        else
            render json: @room.errors,status: :unprocessable_entity
        end
    end

    def destroy
        @room = Room.find(params[:id])
        if @room.destroy
            head :no_content
        else
            render json: @room.errors, status: :unprocessable_entity
        end
    end
    
    def search
        @q = Room.ransack(search_params)
        @rooms = @q.result
        render 'search', formats: :json ,handlers: 'jbuilder'
    end

    private

    def room_params
        params.fetch(:room,{}).permit(
            :user_id, :area, :genre, :artist, :dgiate, :time, :comment
        )
    end

    def search_params
        params.require(:q).permit(
            :area_eq,:genre_eq,:artist_cont,:date_eq,:time_start
        )
    end
end
