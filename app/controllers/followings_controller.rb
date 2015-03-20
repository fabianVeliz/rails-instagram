class FollowingsController < ApplicationController
  before_action :authenticate_user!
  expose(:user) { User.friendly.find(params[:slug]) }

  def create
    if can_follow?
      following = current_user.followings.build( user_following_id: user.id)
      @success = following.save
    end
  end

  def destroy
    following = current_user.followings.where(user_following_id: user.id).first
    @success = following.destroy
  end

  private

  def can_follow?
    if current_user.id == user.id || current_user.followed_users_ids.include?(user.id)
      false
    else
      true
    end
  end
end
