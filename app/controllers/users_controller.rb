class UsersController < ApplicationController
  expose(:user)   { User.friendly.find(params[:slug])}
  expose(:photos) { user.photos }
  expose(:users)

  def index; end
  def profile; end
end
