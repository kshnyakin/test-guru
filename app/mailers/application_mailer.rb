# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: %("TestGuru" <thinknetika@gmail.com>)
  layout 'mailer'
end
