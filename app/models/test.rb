# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :test_passings
  has_many :users, through: :test_passings

  def self.list_by_category(category_title)
    joins('INNER JOIN categories ON tests.category_id = categories.id')
      .where(categories: { title: category_title })
      .order(title: :desc)
      .pluck(:title)
  end
end
