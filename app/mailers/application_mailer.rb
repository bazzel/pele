# frozen_string_literal: true

#:nodoc:
class ApplicationMailer < ActionMailer::Base
  default from: ENV.fetch('SENDGRID_SENDER', 'noreply@example.com')
  layout 'mailer'
end
