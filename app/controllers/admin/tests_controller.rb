# frozen_string_literal: true

class Admin::TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_test, only: %i[show edit update destroy start]

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
      redirect_to admin_test_path(@test)
    else
      render :edit
    end
  end

  def create
    @test = Test.new(test_params)
    if @test.save
      redirect_to admin_test_path(@test)
    else
      render :new
    end
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.take_test_passing(@test)
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end

  def load_test
    @test ||= Test.find(params[:id])
  end
end
