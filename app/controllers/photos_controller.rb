class PhotosController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    if user_signed_in?
      @photos = Photo.where(user_id: current_user.followed_users_and_me)
    else
      @photos = Photo.includes(:user).all
    end
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = current_user.photos.build(photo_params)

    if @photo.save
      redirect_to photo_path(@photo), notice: 'The photo has been uploaded'
    else
      render :new
    end
  end

  def show
    @photo = Photo.find(params[:id])
    @comment = Comment.new
    @comments = @photo.comments.all.includes(:user)
  end

  private

  def photo_params
    params.require(:photo).permit(:title, :description, :asset)
  end
end
