# frozen_string_literal: true

class Admin::GistsController < Admin::BaseController
  def create
    test_passing = TestPassing.find(accepted_params[:format])
    current_question = test_passing.current_question
    result = GistQuestionService.new(current_question).call
    creating_gist(result.response, current_question)
    redirect_to test_passing_path(test_passing), notice: prepare_notice(result)
  end

  private

  def accepted_params
    params.permit(:format)
  end

  def creating_gist(github_result, current_question)
    Gist.create!({
                   user: current_user,
                   question: current_question,
                   url: github_result.html_url
                 })
  end

  def prepare_notice(result)
    if result.success?
      t('.success', url: result.response.html_url)
    else
      t('.failure')
    end
  end
end
