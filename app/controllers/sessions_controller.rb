# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def logout
    session.delete(:user_id)
    redirect_to login_path
  end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to session[:url_return_to] || root_path
    else
      flash.now[:alert] = 'Please, check your emal or password and try again'
      render :new
    end
  end
end
