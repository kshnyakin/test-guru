# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    flash[:notice] = "Привет, #{current_user.first_name}!"
    if current_user.admin?
      admin_tests_path
    else
      super(resource)
    end
  end
end
