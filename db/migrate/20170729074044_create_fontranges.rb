class CreateFontranges < ActiveRecord::Migration
  def change
    create_table :fontranges do |t|
      t.integer :fontcompany_id
      t.integer :category_id
      t.boolean :range

      t.timestamps null: false
    end
  end
end
