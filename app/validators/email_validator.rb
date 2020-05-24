# frozen_string_literal: true

#:nodoc:
class EmailValidator < ActiveModel::EachValidator
  attr_reader :value

  def validate_each(record, attribute, value)
    @value = value

    return if value.blank?
    return if a_valid_email_address?

    record.errors.add attribute, (options[:message] || :not_an_email_address)
  end

  private

  def not_an_email_address?
    value !~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  end

  def a_valid_email_address?
    !not_an_email_address?
  end
end
