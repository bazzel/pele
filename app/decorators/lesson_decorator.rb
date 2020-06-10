# frozen_string_literal: true

#:nodoc:
class LessonDecorator < ApplicationDecorator
  delegate_all
  decorates_association :song

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end
  def link_to_pin_or_unpin
    link_to_pin || link_to_unpin
  end

  private

  def link_to_pin
    return unless pin?

    body = h.material_icon('push_pin')
    url =
      h.pins_path(
        pin: { pinnable_id: object.id, pinnable_type: object.class.name }
      )

    h.link_to body, url, link_to_pin_options
  end

  def link_to_unpin
    return unless unpin?

    body = h.material_icon('push_pin')
    pin = pins.find { |p| p.user == h.current_user }
    url = h.pin_path(pin)

    h.link_to body, url, link_to_unpin_options
  end

  def unpin?
    pin_policy.destroy?
  end

  def pin?
    pin_policy.create?
  end

  def pin_policy
    pin = pins.find { |p| p.user == h.current_user }
    PinPolicy.new(h.current_user, pin)
  end

  def link_to_unpin_options
    tooltip = h.tooltipify(I18n.t('pins.destroy.title'), model: dom_id(:pin))
    default_html_options('text-primary visible').merge(tooltip, method: :delete)
  end

  def link_to_pin_options
    tooltip = h.tooltipify(I18n.t('pins.create.title'), model: dom_id(:pin))
    default_html_options.merge(tooltip, method: :post)
  end
end
