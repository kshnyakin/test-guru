# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :test

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions
    respond_to do |format|
      format.html
      format.txt { render plain: @questions.inspect }
    end
  end

  def create
    question = @test.questions.create!(question_params)
    render plain: "Вопрос (#{question.title}) был успешно создан"
  end

  def new; end

  def show
    @question = question_from_test_by_id(params[:id])
    respond_to do |format|
      format.html
      format.txt { render plain: @question.inspect }
    end
  end

  def destroy
    question = question_from_test_by_id(params[:id])
    if question
      question.destroy
      render plain: 'Вопрос был успешно удален'
    else
      render plain: 'id вопроса для удаления не принадлежит данному тесту'
    end
  end

  private

  def test
    @test ||= Test.find(params[:test_id].to_i)
  end

  def question_from_test_by_id(id_string)
    question = @test.questions.find_by(id: id_string.to_i)
    raise ActiveRecord::RecordNotFound unless question
  end

  def question_params
    params.require(:question).permit(:title, :body)
  end

  def rescue_with_question_not_found
    render plain: 'Вопрос с указанным ID не был найден'
  end
end
