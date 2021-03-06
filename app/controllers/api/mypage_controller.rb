class Api::MypageController < ApplicationController
  def index
    profile = Profile.find_or_create_by(user_id: current_user.id)
    render json: profile, serializer: ProfileSerializer
  end

  def show
    profile = Profile.find_or_create_by(user_id: params[:id])
    render json: profile, serializer: ProfileSerializer
  end

  def update
    profile = Profile.find_or_initialize_by(user_id: params[:id])
    profile.update(profile_params)
    render json: profile , serializer: ProfileSerializer
  end

  private

  def profile_params
    params.fetch(:profile).permit(
      :area, :age,:sex, :living, :height, :look, :belongs, :holiday, :smoke, :drink, :detail
    )
  end
end