# frozen_string_literal: true

module TestPassingsHelper
  def test_result_message(test_passing)
    result_message = result_message(test_passing)
    content_tag(:h3, result_message[:text], style: "color: #{result_message[:color]};")
  end

  def question_informator(test_passing)
    info = test_passing.question_progress_info
    text = "Вопрос № #{info[:current_question_number]} из #{info[:questions_size]}"
    content_tag(:p, text)
  end

  private

  def result_message(test_passing)
    text = ''
    color = ''
    if test_passing.successful?
      text = "Поздравляем вас с прохождением теста! Процент прохождения: #{test_passing.percentage}%"
      color = 'green'
    else
      text = "К сожалению, тест не пройден. Процент прохождения: #{test_passing.percentage}%"
      color = 'red'
    end
    { text: text, color: color }
  end
end
