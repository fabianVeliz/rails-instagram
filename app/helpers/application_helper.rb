module ApplicationHelper
  def get_avatar(user)
    image_tag user.avatar.url(:thumb)+"?d=identicon&amp;f=y"
  end
end
