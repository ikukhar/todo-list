class User < ActiveRecord::Base

  devise :database_authenticatable,
         :registerable,
         :rememberable,
         :omniauthable

  validates_presence_of   :email, if: :email_required?
  validates_uniqueness_of :email, allow_blank: true, if: :email_changed?, scope: [:provider, :uid]
  validates_format_of     :email, with: Devise.email_regexp, allow_blank: true, if: :email_changed?

  validates_presence_of     :password, if: :password_required?
  validates_confirmation_of :password, if: :password_required?
  validates_length_of       :password, within: Devise.password_length, allow_blank: true

  def password_required?
    return false if email.blank?
    !persisted? || !password.nil? || !password_confirmation.nil?
  end

  def email_required?
    true
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
     user.email = auth.info.email ? auth.info.email : "blank_email@#{auth.provider}.com"
     user.password = Devise.friendly_token[0,20]
     user.username = auth.info.name
    end
  end

end
