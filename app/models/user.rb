class User < ActiveRecord::Base
  has_many :todos, ->{ order(created_at: :desc) }
  has_many :categories

  validates_presence_of :email

  has_secure_password
end
