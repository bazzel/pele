# frozen_string_literal: true

class ToggleButtonsCheckboxInput < SimpleForm::Inputs::BooleanInput #:nodoc:
  def input(wrapper_options)
    add_tooltip
    add_active_class

    super
  end

  private

  def add_tooltip
    return if placeholder_text.blank?

    options[:wrapper_html] ||= {}
    options[:wrapper_html][:data] ||= {}
    options[:wrapper_html][:data] = { toggle: :tooltip }
    options[:wrapper_html][:title] = placeholder_text
  end

  def add_active_class
    return unless object.send(attribute_name)

    options[:wrapper_html] ||= {}
    options[:wrapper_html][:class] ||= ''
    options[:wrapper_html][:class] += ' active'
  end
end
