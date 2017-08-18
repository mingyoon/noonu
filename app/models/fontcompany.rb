class Fontcompany < ActiveRecord::Base
    has_many :fontranges #m:n테이블
    has_many :categories, through: :fontranges
    has_many :krfonts
end
