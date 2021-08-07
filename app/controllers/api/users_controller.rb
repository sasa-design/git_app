class Api::UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    render json: user,serializer: ImageSerializer
  end

  def update
    user = User.find(params[:id])
    if user.update(image_params)
      user.decode64(image_params[:image])
      render json: user ,serializer: ImageSerializer
    else 
      render json: user.errors,status: :unprocessable_entity
    end
  end 

  def create
    user = User.create(user_params)
    if user.save
      render json: { success:[ '登録が完了しました'] }
    else
      render json: { message: ['please input again'] },status: :unprocessable_entity
    end
  end

  def followers
    page = params[:page]
    per = 4
    user = User.find(current_user.id)
    users = user.follows.page(page).per(per)
    render json: users, each_serializer: ImageSerializer
  end

  def matchers
    page = params[:page]
    per = 4
    user = User.find(current_user.id)
    users = user.matchers.page(page).per(per)
    render json: users, each_serializer: ImageSerializer
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def image_params
    params.require(:imageFile).permit(:image)
  end

end
