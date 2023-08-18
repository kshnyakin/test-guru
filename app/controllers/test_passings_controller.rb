# frozen_string_literal: true

class TestPassingsController < ApplicationController
  before_action :set_test_passing, only: %i[show update result]

  def show; end

  def update
    @test_passing.accept!(update_params)
    if @test_passing.completed?
      redirect_to result_test_passing_path(@test_passing)
    else
      render :show
    end
  end

  def result; end

  private

  def set_test_passing
    @test_passing = TestPassing.find(params[:id])
  end

  def update_params
    params[:answer_ids]
  end
end
