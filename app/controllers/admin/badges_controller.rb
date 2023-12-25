# frozen_string_literal: true

class Admin::BadgesController < Admin::BaseController
  before_action :set_badge, only: %i[show edit update]

  def show
    @badge = Badge.find(params[:id])
  end

  def new
    @badge = Badge.new
  end

  def create
    binding.pry
    @badge = Badge.new(badge_params)
    if @badge.save
      redirect_to admin_badge_path(@badge), notice: t('.success')
    else
      render :new
    end
  end

  def edit; end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badge_path(@badge), notice: 'Badge was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(:name, :award_type, :award_condition, :img_path)
  end
end
