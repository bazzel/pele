# frozen_string_literal: true

require 'text_field_box'
#:nodoc:
class NumericInput < SimpleForm::Inputs::NumericInput
  include TextFieldBox
end
