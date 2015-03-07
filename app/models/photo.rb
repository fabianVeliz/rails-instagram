class Photo < ActiveRecord::Base

  has_attached_file :asset,
                    styles: {
                        thumb: "70x70",
                        medium: "500x500"
                    },
                    default_url: "/images/:style/missing.png"
  validates_attachment_content_type :asset,
                                    content_type: /\Aimage\/.*\Z/

  belongs_to :user
  has_many :comments
end
