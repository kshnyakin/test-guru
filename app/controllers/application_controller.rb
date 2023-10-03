# frozen_string_literal: true

class ApplicationController < ActionController::Base

  def after_sign_up_path_for(resource)
    redirect_to admin_tests_path
  end
end
