# frozen_string_literal: true

class TestPassingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passing, only: %i[show update result]

  def show; end

  def update
    @test_passing.accept!(update_params)
    if test_time_expired? || @test_passing.completed?
      TestsMailer.completed_test(@test_passing).deliver_now
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

  def test_time_expired?
    test_duration_min = @test_passing.test.duration_min
    passing_started_at = @test_passing.created_at
    Time.current - passing_started_at > (test_duration_min * 60)
  end
end
