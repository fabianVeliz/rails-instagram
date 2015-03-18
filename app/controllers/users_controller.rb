class UsersController < ApplicationController
  expose(:user_name){ params[:user_name] }
  expose(:users)

  def index; end

  def profile
    @user = User.find_by(user_name: user_name)
    @photos = User.find_by(user_name: user_name).photos
  end

end
