class FollowingsController < ApplicationController
  def create
    user_name = params[:user_name]
    user_following = User.find_by(user_name: user_name)

    following = current_user.followings.build( user_following_id: user_following.id)

    if following.save
      redirect_to user_profile_path(user_name), notice: 'You follow a user'
    else
      render :back
    end
  end
end
