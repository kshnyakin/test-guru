# frozen_string_literal: true

class TestPassing < ApplicationRecord
  SUCCESS_RATIO = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_current_question

  def accept!(answer_ids)
    self.correct_questions_counter += 1 if correct_answer?(answer_ids)
    save!
  end

  def completed?
    current_question.nil?
  end

  def successful?
    percentage >= SUCCESS_RATIO
  end

  def percentage
    correct_answers = correct_questions_counter
    total_answers = test.questions.size
    ((correct_answers.to_f / total_answers).round(2) * 100).to_i
  end

  def question_progress_info
    questions_size = test.questions.size
    current_question_number = define_current_question_number
    {
      questions_size: questions_size,
      current_question_number: current_question_number
    }
  end

  private

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.to_a.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first if current_question
  end

  def define_current_question_number
    test
      .questions
      .order(:id)
      .where('id <= ?', current_question.id)
      .size
  end

  def before_validation_set_current_question
    self.current_question = if new_record?
                              test.questions.first
                            else
                              next_question
                            end
  end
end
