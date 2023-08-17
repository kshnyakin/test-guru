# frozen_string_literal: true

module TestPassingsHelper
  def test_result_message(test_passing)
    percentage = passing_percent(test_passing)
    text = result_text(percentage)
    content_tag(:h3, text, style: "color: #{color_percentage_result(percentage)};")
  end

  def question_informator(test_passing)
    total_questions = test_passing.test.questions.size
    current_question_number = define_current_question_number(test_passing)

    text = "Вопрос № #{current_question_number} из #{total_questions}"
    content_tag(:p, text)
  end

  private

  def passing_percent(test_passing)
    correct_answers = test_passing.correct_questions_counter
    total_answers = test_passing.test.questions.size
    ((correct_answers.to_f / total_answers).round(2) * 100).to_i
  end

  def color_percentage_result(percentage)
    percentage >= 85 ? 'green' : 'red'
  end

  def result_text(percentage)
    if percentage >= 85
      "Поздравляем вас с прохождением теста! Процент прохождения: #{percentage}%"
    else
      "К сожалению, тест не пройден. Процент прохождения: #{percentage}%"
    end
  end

  def define_current_question_number(test_passing)
    current_question_id = test_passing.current_question_id
    questions_arr = test_passing.test.questions.order(:id).pluck(:id)
    questions_arr.index(current_question_id) + 1
  end
end
