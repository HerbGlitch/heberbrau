class User < ApplicationRecord
  devise  :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :timeoutable, :omniauthable, omniauth_providers: [:facebook, :github, :google_oauth2, :twitter]
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  mount_uploader :image, ImageUploader

  def self.create_from_provider_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do | user |
      user.email = provider_data.info.email
      user.password = Devise.friendly_token[0, 20]
      # user.skip_confirmation!
    end
  end

  def self.register(data)
    where(provider: data[:provider], uid: data[:uid]).first_or_create do | user |
      user.email = data[:email]
      user.password = data[:password]
    end
  end

  def authenticate(password)
    self.password == password
  end

  def follow(other_user)
    following << other_user
  end

  def unfollow(other_user)
    following.delete(other_user)
  end

  def following?(other_user)
    following.include?(other_user)
  end
end
