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

  private

  def link_to_edit_options
    tooltip = h.tooltipify(I18n.t('songs.edit.title'))
    default_html_options.merge(tooltip)
  end

  def link_to_destroy_options
    tooltip = h.tooltipify(I18n.t('songs.destroy.title'))
    default_html_options.merge(tooltip, method: :delete)
  end
end
