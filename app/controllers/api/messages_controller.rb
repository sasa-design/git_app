class Api::MessagesController < ApplicationController

    def show
        page = fetch_params[:page] || 1
        per = fetch_params[:per] || 10
        messages = Message.where(sender_id: fetch_params[:userId],receiver_id: params[:id])
        .or(Message.where(sender_id: params[:id], receiver_id: fetch_params[:userId])).order(id: :DESC)
        @messages = messages.page(page).per(per)
        render json: @messages , each_serializer: MessageSerializer
    end

    def create
        message = Message.create(message_params)
        if message.save
            render json: message, serializer: MessageSerializer
        else
            render json: message.errors, status: :unprocessable_entity
        end
    end

    private
    def fetch_params
        params.require(:q).permit(:userId,:page,:per)
    end

    def message_params
        params.require(:message).permit(:sender_id,:receiver_id,:content,:user_id)
    end
end
