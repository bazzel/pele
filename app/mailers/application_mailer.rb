# frozen_string_literal: true

#:nodoc:
class ApplicationMailer < ActionMailer::Base
  default from: ENV.fetch('SENDGRID_SENDER', 'no-reply@example.com')
  layout 'mailer'
end
