class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise  :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable, :timeoutable,
        :omniauthable, omniauth_providers: [:facebook, :github, :google_oauth2, :twitter]

  def self.create_from_provider_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do | user |
      user.email = provider_data.info.email
      user.password = Devise.friendly_token[0, 20]
      # user.skip_confirmation!
    end
  end

  def self.register(data)
    where(provider: 'site', uid: User.maximum(:id).next).first_or_create do | user |
      user.email = data[:email]
      user.password = data[:password]
    end
  end

  # def self.authenticate(email, password)
  #   user = where('email = ?', email)
  #   return user if user && user.authenticated?(password)
  # end

  def authenticate(password)
    self.password == password
  end
end
