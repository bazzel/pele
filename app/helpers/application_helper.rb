# frozen_string_literal: true

#:nodoc:
module ApplicationHelper
  def app_name
    Rails.application.config.app_name
  end

  def modal_id
    'modal'
  end

  def show_more_link_to(scope, name, options = {})
    disable_with =
      safe_join([tag.div(spinner, class: 'spinner-container'), name], ' ')
    icon = material_icon('keyboard_arrow_down')
    name = safe_join([icon, name], ' ')

    options.deep_merge!({ data: { disable_with: disable_with } })

    link_to_next_page scope, name, options
  end
end
