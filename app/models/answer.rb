# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_answers_quantity, on: %i[create update]

  scope :correct, -> { where(correct: true) }

  def validate_answers_quantity
    errors.add(:base) if question.answers.count > 3
  end
end
