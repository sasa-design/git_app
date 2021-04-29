class Api::UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    render json: user,serializer: UserSerializer
  end

  def update
    user = User.find(params[:id])
    if user.update(image_params)
      user.decode64(image_params[:image])
      render json: user ,serializer: UserSerializer
    else 
      render json: user.errors,status: :unprocessable_entity
    end
  end 

  def create
    user = User.create(user_params)
    render json: user,serializer: UserSerializer
  end

  def followers
    user = User.find(current_user.id)
    users = user.follows
    render json:  users, each_serializer: UserSerializer
  end

  def matchers
    user = User.find(current_user.id)
    users = user.matchers
    render json: users, each_serializer: UserSerializer
  end
    
  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def image_params
    params.require(:imageFile).permit(:image)
  end

end
