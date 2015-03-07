module ApplicationHelper
  def get_avatar(user)
    image_tag user+"?d=identicon&amp;f=y"
  end
end
