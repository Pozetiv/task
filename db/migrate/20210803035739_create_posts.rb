class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text    :content, null: false
      t.string  :title, null:false
      t.integer :user_id, null: false, index: true

      t.timestamps
    end

    add_foreign_key :posts, :users
  end
end
