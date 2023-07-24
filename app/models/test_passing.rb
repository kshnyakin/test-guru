# frozen_string_literal: true

class TestPassing < ApplicationRecord
  belongs_to :user
  belongs_to :test

  validates :passing_status, presence: true
end
