# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_answers_quantity, on: %i[create update]

  scope :correct, -> { where(correct: true) }

  private

  def validate_answers_quantity
    binding.pry
    # попробовать тут поймат action)))
    errors.add(:base) if question.answers.count > 3
  end
end
