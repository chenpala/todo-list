module ApplicationHelper
  def categories_helper
    current_user.categories.map(&:name).zip current_user.categories.map(&:id)
  end
end
