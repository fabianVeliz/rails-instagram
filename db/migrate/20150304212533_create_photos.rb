class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title
      t.text :description
      t.attachment :asset
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
