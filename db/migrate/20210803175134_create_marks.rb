class CreateMarks < ActiveRecord::Migration[5.2]
  def change
    create_table :marks do |t|
      t.integer :grade, null: false
      t.belongs_to :post, foreign_key: true, index: true
      t.uuid :author_id, null: false

      t.timestamps
    end

    add_column :posts, :avg_mark, :integer, default: 0
    add_index :marks, [:author_id, :post_id], unique: true
  end
end
