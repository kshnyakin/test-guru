class Test < ApplicationRecord
  def self.list_by_category(category_title)
    category = Category.find_by(title: category_title)
    self.where(category_id: category.id).order(:title)
  end
end
