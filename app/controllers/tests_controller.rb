# frozen_string_literal: true

class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_test, only: %i[start]

  def index
    @tests = Test.all
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.take_test_passing(@test)
  end

  private

  def load_test
    @test ||= Test.find(params[:id])
  end
end
