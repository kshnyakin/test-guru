# frozen_string_literal: true

class User < ApplicationRecord
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id'
  has_many :test_passings
  has_many :tests, through: :test_passings

  def tests_by_level(level)
    Test.joins('INNER JOIN test_passings ON tests.id = test_passings.test_id')
        .where(level: level, test_passings: { user_id: id })
  end
end
