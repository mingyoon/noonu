class Krfont < ActiveRecord::Base
    has_many :font_ranges
    has_many :categories, through: :ranges
end
