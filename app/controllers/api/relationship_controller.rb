class Api::RelationshipController < ApplicationController
    def index
        
    end

    def show
        relationship = Relationship.find_by(follow_id: current_user.id,follower_id: params[:id])
        render json: relationship ,serializer: RelationshipSerializer
    end

    def create
        relationship = Relationship.find_or_initialize_by(follow_id: follow_params[:userId],follower_id: follow_params[:follower])
        if relationship.save
            head :no_content
        else
            render json: {error: ['すでにいいねしています']} ,status: :unprocessable_entity
        end
    end

    private
    
    def follow_params
        params.require(:relationship).permit(:userId,:follower)
    end
end