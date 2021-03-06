# frozen_string_literal: true

#:nodoc:
module TextFieldBox
  def input(wrapper_options)
    ensure_placeholder
    decorate_w_required
    swap_hint_w_error

    super
  end

  private

  def decorate_w_required
    return unless @required

    append_required_mark
    prepend_required_text
  end

  def ensure_placeholder
    input_html_options[:placeholder] ||= raw_label_text
  end

  def append_required_mark
    input_html_options[:placeholder].concat(self.class.translate_required_mark)
  end

  def prepend_required_text
    @hint =
      [
        "#{self.class.translate_required_mark} #{
          self.class.translate_required_text.titleize
        }",
        hint
      ].compact.join(' - ')
  end

  # see https://material.io/components/text-fields/#anatomy
  def swap_hint_w_error
    input_options[:hint] = false if object.errors[attribute_name].any?
  end
end
