# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: %("TestGuru" <ak@devpull.ru>)
  layout 'mailer'
end
