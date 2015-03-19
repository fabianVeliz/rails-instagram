module ApplicationHelper
  def get_avatar(user)
    image_tag user+"?d=identicon&amp;f=y"
  end

  def my_profile?
    current_user.slug == params[:slug]
  end

end
