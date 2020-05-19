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
    h.fab_wrapper { h.fab_button(h.new_song_path, remote: true) }
  end

  def form_title
    title_was ||
      I18n.t('songs.new.title', subject: self.class.model_name.human.downcase)
  end

  def link_to_edit
    # return unless h.policy(object).edit?

    tooltip = h.tooltipify(I18n.t('songs.edit.title'))
    body = h.material_icon('create')
    url = h.edit_song_path(object)

    h.link_to body, url, default_html_options.merge(tooltip)
  end

  private

  def default_html_options(class_name = nil)
    { remote: true, class: h.sm_rnd_btn_class(class_name), role: :button }
  end
end
