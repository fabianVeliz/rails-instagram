class UsersController < ApplicationController
  expose(:user_name){ params[:user_name] }

  def profile
    @user = User.find_by(user_name: user_name)
    @photos = User.find_by(user_name: user_name).photos.all
  end

end
