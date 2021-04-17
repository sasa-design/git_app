class Api::MessagesController < ApplicationController

    def show
        messages = Message.where(sender_id: current_user.id,receiver_id: params[:id])
        .or(Message.where(sender_id: params[:id], receiver_id: current_user.id)).order(id: :DESC)
        render json: messages , each_serializer: MessageSerializer
    end

    def create
        message = Message.create(message_params)
    end

    private

    def message_params
        params.require(:message).permit(:content,:receiver_id)
        .merge(sender_id: current_user.id)
    end
end
