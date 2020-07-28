class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
  	@user = current_user
  	@users = User.all
    @favorite = @user.favorites
    @favorites = @user.favorites_hospital
  end

  def update
  	@user = User.find(params[:id])
  	@user.update(user_params)
  	redirect_to users_path
  end

  private
  def user_params
  	params.require(:user).permit(:user_image)
  end
end