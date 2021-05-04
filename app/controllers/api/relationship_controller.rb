class Api::RelationshipController < ApplicationController
    
    def index
        
    end

    def show
        relationship = Relationship.find_by(follow_id: current_user.id,follower_id: params[:id])
        render json: relationship ,serializer: RelationshipSerializer
    end

    def create
        relationship = Relationship.find_or_initialize_by(follow_id: current_user.id,follower_id: params[:follower])
        unless params[:follow_id] = params[:follower_id]
            relationship.save
            head :no_content
        else
            render json: relationship.errors, status: :unprocessable_entity
        end
    end

    private
    
    def follow_params
        params.permit(:follower_id).merge(follow_id: current_user.id)
    end
end