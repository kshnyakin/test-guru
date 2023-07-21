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

  # не стал переписывать на scope т.к. это метод экземпляра класса,
  # а scope - метод самого класса
  def tests_by_level(level)
    tests.where(level: level)
  end
end
