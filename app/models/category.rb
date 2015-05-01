class Category < ActiveRecord::Base
  has_many :todos

  validates_presence_of :name
end
