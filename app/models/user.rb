class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  require 'httparty'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[facebook]

  def self.from_omniauth(auth)
    find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name
      user.fb_pic_url = auth.info.image
      user_id = auth.uid
      access_token = auth.credentials.token
      response = HTTParty.get("https://graph.facebook.com/#{user_id}?fields=link&access_token=#{access_token}")
      user_link = JSON.parse(response.body)['link']
      user.profile_link = user_link
    end
  end
end
