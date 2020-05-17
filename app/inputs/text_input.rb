# frozen_string_literal: true

require 'text_field_box'
#:nodoc:
class TextInput < SimpleForm::Inputs::TextInput
  include TextFieldBox
end
