class Category < ActiveRecord::Base
    has_many :fontranges #m:n테이블
    has_many :fontcompanies, through: :fontranges 
end
