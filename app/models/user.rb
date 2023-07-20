# frozen_string_literal: true

class User < ApplicationRecord
  # коммент для инициализации PR
  has_many :created_tests,
           class_name: 'Test',
           foreign_key: 'author_id',
           dependent: :destroy,
           inverse_of: :author
  has_many :test_passings, dependent: :destroy
  has_many :tests, through: :test_passings

  def tests_by_level(level)
    tests.where(level: level)
  end
end
