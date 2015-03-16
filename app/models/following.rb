class Following < ActiveRecord::Base
  belongs_to :user
  belongs_to :user_following, class_name: 'User'
end
