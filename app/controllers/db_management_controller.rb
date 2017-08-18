class DbManagementController < ApplicationController
  def index
  end

  def font_db
  end

  def category_db
  end

  def font_create
    
      t.string :fontName
      t.integer :fontcompany_id
      t.string :font_style, default: :nul
      t.text :font_cdn, default: :null
      t.string :d_link, default: :null #다운로드링크
      t.string :ph_content #placeholder내용 
      t.text :content, default: :null #기타 내용

    new_krfont = Krfont.new
    new_krfont.fontName = params[:fontName]
    new_krfont.fontcompany_id = fontcompanies.where(companyName: params[:companyName]).take.id
    new_krfont.font_style=params[:font_style]
    new_krfont.font_cdn = params[:font_cdn]
    new_krfont.d_link = params[:d_link]
    new_krfont.ph_content=params[:ph_content]
    new_krfont.content = ""
    new_krfont.save
    
    redirect_to '/db_management'
  end

  def category_create
  end
end
