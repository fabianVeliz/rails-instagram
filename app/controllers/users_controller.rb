class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:photos]
  expose(:user_name){ params[:user_name] }
  expose(:user) { User.find_by( user_name: user_name) }

  def profile
    user_by_params = User.find_by(user_name: user_name)

    if user_by_params != current_user
      redirect_to user_photos_path(user_by_params.user_name)
    else
      @user = current_user
    end

  end

  def photos
    @photos = user.photos.all
  end
end
