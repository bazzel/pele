# frozen_string_literal: true

#:nodoc:
class SongDecorator < ApplicationDecorator
  delegate_all
  decorates_association :scores

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

    h.fab_wrapper { h.fab_button(h.new_song_path) }
  end

  def form_title
    title_was ||
      I18n.t('songs.new.title', subject: self.class.model_name.human.downcase)
  end

  def title_and_songwriter
    content = h.tag.div(title, class: 'text-truncate')

    if songwriter
      content <<
        h.tag.div(" - #{songwriter_name}", class: 'text-black-50 text-truncate')
    end
    content
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

  def formatted_tag_list
    h.safe_join(
      tag_list.map do |tag|
        h.tag.small(h.tag.span(tag, class: 'badge badge-light'), class: 'mr-2')
      end
    )
  end

  def score_badges
    return if scores.none?

    badges =
      scores.first(3).each_with_index.map do |score, i|
        i < 2 ? score.attachment_badge : show_more_scores_badge
      end

    h.safe_join(badges)
  end

  private

  def show_more_scores_badge
    h.content_tag(:div, class: 'badge badge-pill badge-light border py-1') do
      h.content_tag(:span, "+#{scores.size - 2}", class: 'text-dark small')
    end
  end

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

  def link_to_edit_options
    tooltip = h.tooltipify(I18n.t('songs.edit.title'))
    default_html_options(nil, false).merge(tooltip)
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
