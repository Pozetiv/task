class CreateMarks < ActiveRecord::Migration[5.2]
  def change
    create_table :marks do |t|
      t.integer :result, null: false
      t.belongs_to :post, foreign_key: true, index: true

      t.timestamps
    end

    add_column :posts, :avg_mark, :integer, default: 0
  end
end
