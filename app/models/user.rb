class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :rememberable,
         :validatable,
         :omniauthable

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    #  user.email = auth.info.email if auth.info.email && !auth.info.email.blank?
     user.password = Devise.friendly_token[0,20]
     user.username = auth.info.name   # assuming the user model has a name
    end
  end

end
