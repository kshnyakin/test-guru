# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :load_test, only: %i[create new index]
  before_action :load_question, only: %i[destroy]

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
    @question = Question.find(params[:id])
  end

  def destroy
    @question.destroy
    redirect_to "/test/#{@question.test.id}/questions"
  end

  private

  def load_test
    @test ||= Test.find(params[:test_id])
  end

  def load_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :body)
  end

  def rescue_with_question_not_found
    render file: Rails.root.join('public/404'), status: :not_found
  end
end
