# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  def after_sign_in_path_for(resource)
    if current_user.admin?
      admin_tests_path
    else
      super(resource)
    end
  end

  def default_url_options
    { lang: I18n.locale }
  end

  private

  def set_locale
    url_locale = params[:lang]
    I18n.locale = I18n.locale_available?(url_locale) ? url_locale : I18n.default_locale
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[login first_name last_name])
  end
end
