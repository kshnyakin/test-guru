# frozen_string_literal: true

class Admin::TestsController < Admin::BaseController
  before_action :load_test, only: %i[show edit update destroy]

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
    redirect_to admin_tests_path
  end

  def update
    if @test.update(test_params)
      redirect_to admin_test_path(@test)
    else
      render :edit
    end
  end

  def create
    @test = current_user.created_tests.build(test_params)
    if @test.save
      redirect_to admin_test_path(@test), notice: t('.success')
    else
      render :new
      # redirect_to new_admin_test_path, alert: t(@test.errors.full_messages)
    end
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def load_test
    @test ||= Test.find(params[:id])
  end
end
