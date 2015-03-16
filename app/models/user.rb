class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar,
                    styles: {
                        medium: "300x300>",
                        thumb: "40x40#"
                    },
                    default_url: Proc.new{ |a| a.instance.get_gravatar }

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates_uniqueness_of :user_name

  has_many :photos
  has_many :comments
  has_many :followings

  def get_gravatar
    "http://www.gravatar.com/avatar/"+Digest::MD5.hexdigest(email)
  end

  def follow_user?(user)
    if followings.where(user_following_id: user.id).first
      true
    else
      false
    end
  end
end
