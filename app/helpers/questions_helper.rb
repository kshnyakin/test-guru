# frozen_string_literal: true

module QuestionsHelper
  ACTIONS_SLUG = { 'new' => 'Create New', 'edit' => 'Edit' }.freeze

  def question_header(action, test_title)
    text = "#{ACTIONS_SLUG[action]} '#{test_title}' Question"
    content_tag(:h1, text)
  end
end
