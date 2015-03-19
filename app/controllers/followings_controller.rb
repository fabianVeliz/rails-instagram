class FollowingsController < ApplicationController
  before_action :authenticate_user!

  def create
    slug = params[:slug]
    user_following = User.friendly.find(slug)

    following = current_user.followings.build( user_following_id: user_following.id)

    if following.save
      redirect_to user_profile_path(slug), notice: 'You follow a user'
    else
      redirect_to :back
    end
  end

  def destroy
    user_id = params[:id]
    following = current_user.followings.where(user_following_id: user_id).first
    following.destroy
    redirect_to :back
  end
end
