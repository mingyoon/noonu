class CreateKrfonts < ActiveRecord::Migration
  def change
    create_table :krfonts do |t|
      
      t.string :fontName
      t.integer :fontcompany_id
      t.string :font_style, default: :nul
      t.text :font_cdn, default: :null
      t.string :d_link, default: :null #다운로드링크
      t.string :ph_content #placeholder내용 
      t.text :content, default: :null #기타 내용

      t.timestamps null: false
    end
  end
end
