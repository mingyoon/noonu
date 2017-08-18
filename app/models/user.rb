class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  def self.find_for_oauth(auth, signed_in_resource = nil)

    identity = Identity.find_for_oauth(auth)
    user = signed_in_resource ? signed_in_resource : identity.user
    if user.nil?
      email = auth.info.email
      user = User.where(:email => email).first
      unless self.where(email: auth.info.email).exists?
        if user.nil?

          if auth.provider == "kakao"
            user = User.new(
              profile_img: auth.info.image,
   
              
              # remote_profile_img_url: auth.info.image.gsub('http://','https://'),

              password: Devise.friendly_token[0,20]
            )

          else
            user = User.new(

              #profile_img: auth.info.image,
              # remote_profile_img_url: auth.info.image.gsub('http://','https://'),

              password: Devise.friendly_token[0,20]
            )
              if auth.info.email !=""
                user.email= auth.info.email
              end
          end
          user.save!
        end
      end
    end

    if identity.user != user
      identity.user = user
      identity.save!
    end
    user

  end


  def email_required?
    false
  end
end