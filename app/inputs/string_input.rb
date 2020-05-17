# frozen_string_literal: true

require 'text_field_box'
#:nodoc:
class StringInput < SimpleForm::Inputs::StringInput
  include TextFieldBox
end
