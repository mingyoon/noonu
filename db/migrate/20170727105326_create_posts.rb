class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      
      t.string :status
      t.string :font_name
      t.string :user_email
      t.integer :best_comment
      
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
