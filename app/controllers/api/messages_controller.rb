class Api::MessagesController < ApplicationController
    before_action :authenticate, only: [:create]
    def index
        messages = Message.find_by(sender_id: current_user.id)
        render json: messages, serializer: MessageSerializer
    end

    def show
        messages = Message.where(sender_id: current_user.id,receiver_id: params[:id])
        .or(Message.where(sender_id: params[:id], receiver_id: current_user.id)).order(id: :DESC)
        render json: messages , each_serializer: MessageSerializer
    end

    def create
        message = Message.create(message_params)
        render json: message, serializer: MessageSerializer
    end

    private

    def message_params
        params.require(:message).permit(:content,:receiver_id)
        .merge(sender_id: current_user.id,user_id: current_user.id)
    end
end
