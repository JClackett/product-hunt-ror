class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.string :url
      t.string :type
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
