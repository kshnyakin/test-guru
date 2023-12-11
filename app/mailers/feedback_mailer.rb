# frozen_string_literal: true

class FeedbackMailer < ApplicationMailer
  def send_feedback(email, body)
    @message = body
    @email = email

    mail to: ENV['FEEDBACK_EMAIL']
  end
end
