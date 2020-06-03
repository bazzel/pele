# frozen_string_literal: true

#:nodoc:
class SongDecorator < ApplicationDecorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end
  def self.floating_action_button
    return unless SongPolicy.new(h.current_user, self.class).new?

    h.fab_wrapper { h.fab_button(h.new_song_path, remote: true) }
  end

  def form_title
    title_was ||
      I18n.t('songs.new.title', subject: self.class.model_name.human.downcase)
  end

  def link_to_edit
    return unless h.policy(object).edit?

    body = h.material_icon('create')
    url = h.edit_song_path(object)

    h.link_to body, url, link_to_edit_options
  end

  def link_to_destroy
    return unless h.policy(object).destroy?

    body = h.material_icon('delete')
    url = object

    h.link_to body, url, link_to_destroy_options
  end

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
    pin = pins.find_by(user: h.current_user)
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
    pin = pins.find_by(user: h.current_user)
    PinPolicy.new(h.current_user, pin)
  end

  def link_to_edit_options
    tooltip = h.tooltipify(I18n.t('songs.edit.title'))
    default_html_options.merge(tooltip)
  end

  def link_to_destroy_options
    tooltip = h.tooltipify(I18n.t('songs.destroy.title'))
    default_html_options.merge(tooltip, method: :delete)
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
