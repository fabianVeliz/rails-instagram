class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @photos = @user.photos.all
  end
end
