class Api::RelationshipController < ApplicationController
    
    def index
        
    end

    def show

    end

    def create
        relationship = Relationship.find_or_initialize_by(follow_id: current_user.id,follower_id: params[:follower])
        if relationship.save
            head :no_content
        else
            render json: relationship.error
        end
    end

    private
    
    def follow_params
        params.permit(:follower_id).merge(follow_id: current_user.id)
    end
end