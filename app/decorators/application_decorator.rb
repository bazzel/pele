# frozen_string_literal: true

#:nodoc:
class ApplicationDecorator < Draper::Decorator
  # Define methods for all decorated objects.
  # Helpers are accessed through `helpers` (aka `h`). For example:
  #
  #   def percent_amount
  #     h.number_to_percentage object.amount, precision: 2
  #   end
  def dom_id(prefix = nil)
    h.dom_id(object, prefix)
  end

  protected

  def default_html_options(class_name = nil, remote = true)
    html_options = { class: h.sm_rnd_btn_class(class_name), role: :button }

    html_options[:remote] = true if remote

    html_options
  end
end
