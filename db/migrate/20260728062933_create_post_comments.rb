class CreatePostComments < ActiveRecord::Migration[8.0]
  def change
    create_table :post_comments do |t|
      t.timestamps
      t.integer :user_id
      t.integer :post_image_id
      t.text :comment
    end
  end
end
