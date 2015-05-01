class Category < ActiveRecord::Base
  belongs_to :user
  has_many :todos

  validates_presence_of :name, :user_id
  validates_uniqueness_of :name
end
