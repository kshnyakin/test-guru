# frozen_string_literal: true

module TestPassingsHelper
  def test_result_message(test_passing)
    result_message = result_message(test_passing)
    content_tag(:h3, result_message[:text], style: "color: #{result_message[:color]};")
  end

  def question_informator(test_passing)
    info = test_passing.question_progress_info
    text = t('view_helpers.test_passing.question_info_string',
             current_question: info[:current_question_number],
             total_questions: info[:questions_size])
    content_tag(:p, text)
  end

  private

  def result_message(test_passing)
    text = ''
    color = ''
    if test_passing.successful?
      text = t(
        'view_helpers.test_passing.passing_success', passing_percentage: test_passing.percentage
      )
      color = 'green'
    else
      text = t(
        'view_helpers.test_passing.passing_fail', passing_percentage: test_passing.percentage
      )
      color = 'red'
    end
    { text: text, color: color }
  end
end
