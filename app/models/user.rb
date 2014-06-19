class User < ActiveRecord::Base
  devise :database_authenticatable, :rememberable, :trackable,
         :omniauthable, omniauth_providers: [:google_oauth2]
  has_many :listings

  # :email, :password, :password_confirmation, :remember_me, :avatar, :name

  validates :email, presence: true, uniqueness: true

  def self.find_or_create_google(auth_hash)
    user = where(email: auth_hash[:info][:email]).first_or_create! do |u|
      u.password = Devise.friendly_token[0,20]
    end
    user.name = auth_hash[:info][:name]
    user.avatar = auth_hash[:info][:image]
    user.save if user.changed?
    user
  end

end
