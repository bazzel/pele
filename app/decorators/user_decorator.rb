# frozen_string_literal: true

#:nodoc:
class UserDecorator < ApplicationDecorator
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
    h.fab_wrapper { h.fab_button(h.new_user_path, remote: true) }
  end

  def to_label
    return name.truncate(25) if name.present?

    email
  end
  alias to_s to_label

  def form_title
    name_was || email_was ||
      I18n.t('users.new.title', subject: self.class.model_name.human.downcase)
  end

  def link_to_edit
    # return unless h.policy(object).edit?

    tooltip = h.tooltipify(I18n.t('users.edit.title'))
    body = h.material_icon('create')
    url = h.edit_user_path(object)
    html_options = default_html_options.merge(tooltip)

    h.link_to body, url, html_options
  end

  def link_to_destroy
    # return unless h.policy(object).destroy?

    tooltip = h.tooltipify(I18n.t('users.destroy.title'))
    body = h.material_icon('delete')
    url = object
    html_options = default_html_options.merge(tooltip)
    html_options.merge!(method: :delete)

    h.link_to body, url, html_options
  end

  def mail_to
    name ? "#{name} <#{email}>" : email
  end
end
