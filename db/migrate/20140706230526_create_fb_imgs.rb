class CreateFbImgs < ActiveRecord::Migration
  def change
    create_table :fb_imgs do |t|
      t.string :filename
      t.string :ext
      t.integer :imgur_id
      t.boolean :processed

      t.timestamps
    end
  end
end
