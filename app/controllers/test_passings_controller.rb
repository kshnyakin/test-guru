# frozen_string_literal: true

class TestPassingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passing, only: %i[show update result gist]

  def show; end

  def update
    @test_passing.accept!(update_params)
    if @test_passing.completed?
      TestsMailer.completed_test(@test_passing).deliver_now
      redirect_to result_test_passing_path(@test_passing)
    else
      render :show
    end
  end

  def result; end

  def gist
    current_question = @test_passing.current_question
    result = GistQuestionService.new(current_question).call
    flash_options = if result.nil?
                      { notice: t('.failure') }
                    else
                      { notice: t('.success', url: result.html_url) }
                    end

    redirect_to @test_passing, flash_options
  end

  private

  def set_test_passing
    id = params[:id] || params[:test_passing_id]
    @test_passing = TestPassing.find(id)
  end

  def update_params
    params[:answer_ids]
  end
end
