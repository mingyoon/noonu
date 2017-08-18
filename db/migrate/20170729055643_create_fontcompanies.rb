class CreateFontcompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :fontcompanies do |t|
      t.string :companyName
      t.text :license #라이센스
      t.integer :transform

      t.timestamps null: false
    end
  end
end
