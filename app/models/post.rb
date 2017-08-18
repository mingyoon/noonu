class Post < ActiveRecord::Base
  mount_uploader :image, S3Uploader
  belongs_to :user
  has_many :comments
end
