# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :test, only: %i[create new index]
  before_action :question, only: %i[destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions
  end

  def create
    @question = @test.questions.build(question_params)
    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def new; end

  def update; end

  def show
    @question = Question.find(params[:id].to_i)
  end

  def destroy
    if @question.destroy
      flash[:success] = "Вопрос #{@question.title} успешно удален!"
    else
      render file: Rails.root.join('public/500'), status: :internal_server_error
    end
  end

  private

  def test
    @test ||= Test.find(params[:test_id].to_i)
  end

  def question
    @question = Question.find(params[:id].to_i)
    raise ActiveRecord::RecordNotFound unless @question
  end

  def question_params
    params.require(:question).permit(:title, :body)
  end

  def rescue_with_question_not_found
    render file: Rails.root.join('public/404'), status: :not_found
  end
end
