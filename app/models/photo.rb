class Photo < ActiveRecord::Base
  belongs_to :user

  has_attached_file :asset,
                    styles: {
                        thumb: "70x70",
                        medium: "500x500"
                    },
                    default_url: "/images/:style/missing.png"
  validates_attachment_content_type :asset,
                                    content_type: /\Aimage\/.*\Z/
end
