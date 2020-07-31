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

  def new_guest
    # ゲストユーザーがなければ作成する
    user = User.find_or_create_by(email: 'guest@example.com') do |user|
      # ランダムパスワード作成
      user.password = SecureRandom.urlsafe_base64
    end
    sign_in  user
    redirect_to root_path, notice: "ゲストユーザーでログインしました。"
  end

  private
  def user_params
  	params.require(:user).permit(:user_image)
  end
end