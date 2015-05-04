class User < ActiveRecord::Base
  has_many :todos, ->{ order(created_at: :desc) }
  has_many :categories

  validates_presence_of :email
  validates_uniqueness_of :email, on: :create
  validates_presence_of :password, unless: :through_third_website

  has_secure_password validations: false

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

  private

  def through_third_website
    self.provider.present?
  end
end
