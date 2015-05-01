class Todo < ActiveRecord::Base
  belongs_to :category
  belongs_to :user

  validates_presence_of :title, :user_id
end
