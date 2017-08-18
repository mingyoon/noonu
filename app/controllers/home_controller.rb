class HomeController < ApplicationController
  def index
      @fonts = Krfont.all
      @categories = Category.all
      @fontcompanies = Fontcompany.all
    if user_signed_in?
      if current_user.email ==""
        redirect_to "/register/info2"
      end
    end
  end
  
  def search_bar
    @search_key = Krfont.where("fontName Like?","%#{params[:search_text]}%")
    @fontcompanies = Fontcompany.all
    # render :json => {
    #   :select_result => @search_key,
    #   :company => @company_arr
    # }                  
    respond_to do |format|
      format.js
    end 
  end
  
  def search_check
    @checkValue=params[:checkboxValue]
    
    @ranges = Fontrange.where(category_id: @checkValue)
    @select = Fontcompany.all
    
    if @checkValue.length >1 
      i=1
      while i<@checkValue.length
          @select &= Category.find(@checkValue[i]).fontcompanies
          i+=1
      end
    end
    
    @search_key = Krfont.where("fontName Like?","%#{params[:search_text]}%")
    
    respond_to do |format|
      format.js
    end
     # if @checkValue.length >1
      # for i in 1..@checkValue.length
      # @checkValue.each do |i|
     # end
    # # @select = Category.find(@checkValue).fontcompanies
    # if checkValue.length==1
    #   @select =Fontcompany.where(id: Category.find(checkValue[0]).fontcompanies.ids)
    # elsif checkValue.length==2
    #   @select =Fontcompany.where(id: Category.find(checkValue[0]).fontcompanies.ids&Category.find(checkValue[1]).fontcompanies.ids )
    # elsif checkValue.length==3
    #   @select =Fontcompany.where(id: Category.find(checkValue[0]).fontcompanies.ids&Category.find(checkValue[1]).fontcompanies.ids&Category.find(checkValue[2]).fontcompanies.ids )
    # elsif checkValue.length==4
    #   @select =Fontcompany.where(id: Category.find(checkValue[0]).fontcompanies.ids&Category.find(checkValue[1]).fontcompanies.ids&Category.find(checkValue[2]).fontcompanies.ids&Category.find(checkValue[3]).fontcompanies.ids )    
    # elsif checkValue.length==5
    #   @select =Fontcompany.where(id: Category.find(checkValue[0]).fontcompanies.ids&Category.find(checkValue[1]).fontcompanies.ids&Category.find(checkValue[2]).fontcompanies.ids&Category.find(checkValue[3]).fontcompanies.ids&Category.find(checkValue[4]).fontcompanies.ids )
      

    # elsif checkValue.length==6
    #   @select =Fontcompany.where(id: Category.find(checkValue[0]).fontcompanies.ids&Category.find(checkValue[1]).fontcompanies.ids&Category.find(checkValue[2]).fontcompanies.ids&Category.find(checkValue[3]).fontcompanies.ids&Category.find(checkValue[4]).fontcompanies.ids&Category.find(checkValue[5]).fontcompanies.ids )
    # else
    #   @select =Fontcompany.all
    # end
    
  end
  
  
  def font_page
    @krfonts=Krfont.find(params[:font_id])
    @fontcompanies = Fontcompany.find(@krfonts.fontcompany_id)
    @find_range = Fontrange.where(fontcompany_id: @fontcompanies.id)
    
  end  
  
  def pick
    pick_me = [21,20,36,30,2,13,54,67,17,5,35,31,50,66]
    fontcompanyy=[]
    @krfonts = Krfont.where(id:0)
    pick_me.each do |pick_me|
      @krfonts +=Krfont.where(id: pick_me)
      fontcompanyy.push(Krfont.find(pick_me).fontcompany_id)
    end
    @fontcompanies=Fontcompany.all
    @ranges = Fontrange.where(fontcompany_id: fontcompanyy)
  end
  
end