# frozen_string_literal: true

class TestsController < ApplicationController
  before_action :load_test, only: %i[show edit destroy]

  def index
    @tests = Test.all
  end

  def show; end

  def new; end

  def edit; end

  def destroy
    @test.destroy
    redirect_to root_path
  end

  def update
    @test = Test.find(params[:id])
    if @test.update(test_update_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def create
    @test = Test.new(test_create_params)
    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  private

  def test_update_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end

  def test_create_params
    params.permit(:title, :level, :category_id, :author_id)
  end

  def load_test
    @test ||= Test.find(params[:id])
  end
end
