# frozen_string_literal: true

class TestsController < ApplicationController
  before_action :load_test, only: %i[show edit update destroy start]
  before_action :set_user, only: %i[start]

  def index
    @tests = Test.all
  end

  def show; end

  def new
    @test = Test.new
  end

  def edit; end

  def destroy
    @test.destroy
    redirect_to root_path
  end

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def create
    @test = Test.new(test_params)
    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def start
    test_passing = @user.test_passings.create!(
      test: @test,
      passing_status: 'in_progress'
    )
    redirect_to test_passing_path(test_passing)
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end

  def load_test
    @test ||= Test.find(params[:id])
  end

  def set_user
    @user = User.first
  end
end
