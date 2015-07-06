class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.string :url
      t.string :author
      t.integer :user_id
      t.integer :vote

      t.timestamps null: false
    end
  end
end
