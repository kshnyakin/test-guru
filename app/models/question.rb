# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :test
  has_many :test_passings,
           class_name: 'TestPassing',
           foreign_key: 'current_question_id',
           dependent: :destroy,
           inverse_of: :current_question

  has_many :answers, dependent: :destroy
  has_many :gists, dependent: :destroy

  validates :title, :body, presence: true
end
