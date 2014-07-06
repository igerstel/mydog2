class CreateReddits < ActiveRecord::Migration
  def change
    create_table :reddits do |t|
      t.string :name
      t.string :url
      t.integer :imgur_id

      t.timestamps
    end
  end
end
