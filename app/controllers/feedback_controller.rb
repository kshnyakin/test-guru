# frozen_string_literal: true

class FeedbackController < ApplicationController
  def new; end

  def create
    FeedbackMailer.send_feedback(params[:email], params[:body]).deliver_now
    redirect_to feedback_complete_path
  end

  def success; end
end
