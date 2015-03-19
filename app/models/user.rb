class User < ActiveRecord::Base
  extend FriendlyId

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar,
                    styles: {
                        medium: "300x300>",
                        thumb: "40x40#"
                    },
                    default_url: Proc.new{ |a| a.instance.get_gravatar }

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates :user_name, presence: true, uniqueness: { case_sensitive: false }

  has_many :photos
  has_many :comments
  has_many :followings

  has_many :followed_users, through: :followings, source: :user_following

  friendly_id :user_name, use: :slugged

  def get_gravatar
    "//gravatar.com/avatar/"+Digest::MD5.hexdigest(email)
  end

  def follow_user?(user)
    if followings.where(user_following_id: user.id).first
      true
    else
      false
    end
  end

  def followings_count
    followings.count
  end

  def followings_ids
    followings.map{|u| u.user_following_id}
  end

  private

end
