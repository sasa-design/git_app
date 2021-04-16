class Api::UsersController < ApplicationController

  def create
    user = User.new(user_params)
    if user.save
      render json: user,serializer: UserSerializer
    end
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
end
