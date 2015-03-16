class CreateFollowings < ActiveRecord::Migration
  def change
    create_table :followings do |t|
      t.belongs_to :user, index: true
      t.belongs_to :user_following, index: true

      t.timestamps
    end
  end
end
