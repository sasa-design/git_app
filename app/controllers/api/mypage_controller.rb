class Api::MypageController < ApplicationController
  protect_from_forgery :except => [:index,:show,:update]
  def index
    profile = Profile.find_by(user_id: current_user.id)
    render json: profile, serializer: ProfileSerializer
  end

  def show
  end
  
  def update
    @profile = Profile.find_or_initialize_by(user_id: current_user.id)
    @profile.update(profile_params)
    render json: profile , serializer: ProfileSerializer
  end

  private

  def profile_params
    params.fetch(:profile,{}).permit(
      :area, :age,:sex, :living, :height, :look, :type, :holiday, :smoke, :drink, :detail
    ).merge(
      user_id: current_user.id
    )
  end
end