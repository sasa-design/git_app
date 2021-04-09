class Api::MypageController < ApplicationController
  protect_from_forgery :except => [:index,:show,:update]
  def index
    
  end

  def show
    @profile = Profile.find_by(user_id: params[:id])
    render 'show', formats: :json, handlers: 'jbuilder'
  end
  
  def update
    @profile = Profile.find_or_initialize_by(user_id: params[:id])
    @profile.update(profile_params)
    render 'show' , formats: :json, handlers: 'jbuilder'
  end

  private

  def profile_params
    params.fetch(:profile,{}).permit(
      :area, :age,:sex, :living, :height, :look, :type, :holiday, :smoke, :drink, :detail
    )
  end
end