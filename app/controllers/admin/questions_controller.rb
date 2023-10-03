# frozen_string_literal: true

class Admin::QuestionsController < Admin::BaseController
  before_action :load_test, only: %i[create new]
  before_action :load_question, only: %i[show edit destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def create
    @question = @test.questions.build(question_params)
    if @question.save
      redirect_to admin_question_path(@question)
    else
      render :new
    end
  end

  def new
    @test = Test.find(params[:test_id])
    @question = @test.questions.build
  end

  def edit; end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to admin_question_path(@question)
    else
      render :edit
    end
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
  end

  def destroy
    @question.destroy
    redirect_to admin_test_path(@question.test)
  end

  private

  def load_test
    @test ||= Test.find(params[:test_id])
  end

  def load_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :body, :test_id)
  end

  def rescue_with_question_not_found
    render file: Rails.root.join('public/404'), status: :not_found
  end
end
