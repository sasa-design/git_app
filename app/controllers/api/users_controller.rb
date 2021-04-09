class Api::UsersController < ApplicationController
  def show
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user,serializer: UserSerializer
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
