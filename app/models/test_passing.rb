# frozen_string_literal: true

class TestPassing < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_current_question

  SUCCESS_RATIO = 85

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

  def result_message(percentage)
    text = ''
    color = ''
    if percentage >= SUCCESS_RATIO
      text = "Поздравляем вас с прохождением теста! Процент прохождения: #{percentage}%"
      color = 'green'
    else
      text = "К сожалению, тест не пройден. Процент прохождения: #{percentage}%"
      color = 'red'
    end
    { text: text, color: color }
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
    answer_ids = [] unless answer_ids
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def define_current_question_number
    test
      .questions
      .order(:id)
      .where('id <= ?', current_question.id)
      .size
  end

  def before_validation_set_current_question
    if current_question
      self.current_question = next_question
    elsif test.present?
      self.current_question = test.questions.first
    end
  end
end
