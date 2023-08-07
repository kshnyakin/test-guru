# frozen_string_literal: true

module QuestionsHelper
  def question_header(question)
    action = question.new_record? ? 'Create New' : 'Edit'
    text = "#{action} '#{question.test.title}' Question"
    content_tag(:h1, text)
  end
end
