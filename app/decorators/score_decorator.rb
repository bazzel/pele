# frozen_string_literal: true

#:nodoc:
class ScoreDecorator < ApplicationDecorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end
  def attachment_badge
    h.content_tag(
      :div,
      link_to_attachment,
      class: 'badge badge-pill badge-light border py-1 mr-2'
    )
  end

  private

  def link_to_attachment
    h.link_to(
      attachment.url,
      class: 'text-dark small text-truncate',
      target: '_blank',
      rel: 'noopener',
      data: { toggle: 'no-collapse' }
    ) do
      h.concat notation_icons
      h.concat attachment.identifier
    end
  end

  def notation_icons
    h.safe_join(
      [
        tablature_notation_icon,
        standard_notation_icon,
        chord_notation_icon,
        attachment_icon
      ]
    )
  end

  def tablature_notation_icon
    return unless tablature_notation?

    h.content_tag(:span, 'tablature', class: 'pele-icons') + ' '
  end

  def standard_notation_icon
    return unless standard_notation?

    h.content_tag(:span, 'standard', class: 'pele-icons') + ' '
  end

  def chord_notation_icon
    return unless chord_notation?

    h.content_tag(:span, 'chords', class: 'pele-icons') + ' '
  end

  def attachment_icon
    return if tablature_notation? || standard_notation? || chord_notation?

    h.content_tag(:small, h.material_icon('attach_file'))
  end
end
