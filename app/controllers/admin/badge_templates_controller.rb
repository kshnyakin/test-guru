# frozen_string_literal: true

class Admin::BadgeTemplatesController < Admin::BaseController
  before_action :set_badge_template, only: %i[show edit update]

  def show
    @badge_template = BadgeTemplate.find(params[:id])
  end

  def edit; end

  def update
    if @badge_template.update(badge_template_params)
      redirect_to admin_badge_template_path(@badge_template), notice: 'Badge template was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_badge_template
    @badge_template = BadgeTemplate.find(params[:id])
  end

  def badge_template_params
    params.require(:badge_template).permit(:title, :issuance_type, :category_id, :level, :attempts_number)
  end
end
