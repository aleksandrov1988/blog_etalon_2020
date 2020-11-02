class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.text :body
      t.string :title
      t.integer :views_count, default: 0
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
