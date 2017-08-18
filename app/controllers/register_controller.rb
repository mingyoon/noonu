class RegisterController < ApplicationController
  def info1
     redirect_to '/posts'
  end

  def info2

  end
  
  def getEmail
    user=current_user
    kakoEmail=params[:email].first
    if User.where(email: kakoEmail).exists?
      respond_to do |format|
          format.js
      end
    else
      user.email=kakoEmail
      user.save
      redirect_to '/posts'
    end
    
  end
end
