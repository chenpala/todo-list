class User < ActiveRecord::Base
  has_many :todos, ->{ order(created_at: :desc) }

  validates_presence_of :email

  has_secure_password
end
