class CreateImgurs < ActiveRecord::Migration
  def change
    create_table :imgurs do |t|
      t.string :filename
      t.string :url
      t.boolean :processed

      t.timestamps
    end
  end
end
