# frozen_string_literal: true

#:nodoc:
class SongDecorator < Draper::Decorator
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
end
