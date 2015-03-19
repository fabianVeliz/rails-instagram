class FollowingsController < ApplicationController
  before_action :authenticate_user!
  expose(:user) { User.friendly.find(params[:slug]) }

  def create
    following = current_user.followings.build( user_following_id: user.id)
    @success = following.save
  end

  def destroy
    following = current_user.followings.where(user_following_id: user.id).first
    @success = following.destroy
  end
end
