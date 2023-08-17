# frozen_string_literal: true

module TestPassingsHelper
  def test_result_message(test_passing)
    percentage = test_passing.percentage
    result_message = test_passing.result_message(percentage)
    content_tag(:h3, result_message[:text], style: "color: #{result_message[:color]};")
  end

  def question_informator(test_passing)
    info = test_passing.question_progress_info
    text = "Вопрос № #{info[:current_question_number]} из #{info[:questions_size]}"
    content_tag(:p, text)
  end
end
