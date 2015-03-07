class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    photo = Photo.find(params[:photo_id])
    user_id = current_user.id

    @comment = photo.comments.build(comment_params)
    @comment.user_id = user_id

    if @comment.save
      redirect_to photo_path(photo), notice: 'Your comment has been added'
    else
      redirect_to new_photo_comment_path(photo)
    end

  end

  def comment_params
    params.require(:comment).permit(:body, :photo_id)
  end
end
