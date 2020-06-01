# frozen_string_literal: true

#:nodoc:
class GroupDecorator < ApplicationDecorator
  delegate_all
  decorates_association :students
  decorates_association :lessons

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end
  def self.floating_action_button
    h.fab_wrapper { h.fab_button(h.new_group_path) }
  end

  def form_title
    name_was ||
      I18n.t('groups.new.title', subject: self.class.model_name.human.downcase)
  end

  def link_to_edit
    return unless h.policy(object).edit?

    body = h.material_icon('create')
    url = h.edit_group_path(object)

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
    tooltip = h.tooltipify(I18n.t('groups.edit.title'))
    default_html_options(nil, false).merge(tooltip)
  end

  def link_to_destroy_options
    tooltip = h.tooltipify(I18n.t('groups.destroy.title'))
    default_html_options.merge(tooltip, method: :delete)
  end
end
