# frozen_string_literal: true

class User < ApplicationRecord
  has_many :created_tests,
           class_name: 'Test',
           foreign_key: 'author_id',
           dependent: :destroy,
           inverse_of: :author
  has_many :test_passings, dependent: :destroy
  has_many :tests, through: :test_passings

  validates :first_name, :last_name, :login, :email, presence: true

  def tests_by_level(level)
    tests.where(level: level)
  end

  def full_name
    "#{last_name} #{first_name}"
  end
end
