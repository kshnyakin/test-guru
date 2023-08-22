# frozen_string_literal: true

class User < ApplicationRecord

  include Auth

  has_many :created_tests,
           class_name: 'Test',
           foreign_key: 'author_id',
           dependent: :destroy,
           inverse_of: :author
  has_many :test_passings, dependent: :destroy
  has_many :tests, through: :test_passings

  has_secure_password

  def tests_by_level(level)
    tests.where(level: level)
  end

  def full_name
    "#{last_name} #{first_name}"
  end

  def take_test_passing(test)
    test_passings.order(id: :desc).find_by(test_id: test.id)
  end


end
