# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def destroy
    session.delete(:user_id)
    redirect_to login_path
  end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies['url_return_to'] || root_path
      cookies.delete :url_return_to
    else
      flash.now[:alert] = 'Please, check your emal or password and try again'
      render :new
    end
  end
end
