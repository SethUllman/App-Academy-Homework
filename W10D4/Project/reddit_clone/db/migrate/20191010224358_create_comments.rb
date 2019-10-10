class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text  :content, null: false
      t.integer :parent_comment_id
      t.integer :author_id, null: false
      t.integer :post_id, null: false 

      t.timestamps
    end
    add_index :comments, :post_id
  end
end
