Dir[Rails.root.join('lib/components/**/*.rb')].each { |f| require f }

SimpleForm.setup do |config|
  # Custom wrapper to support text field boxes
  # See http://daemonite.github.io/material/docs/4.1/material/text-fields/#text-field-boxes
  config.wrappers(
    :vertical_form_w_text_field_boxes,
    tag: 'div',
    class: 'form-group',
    error_class: 'form-group-invalid',
    valid_class: 'form-group-valid'
  ) do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :minlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly

    b.wrapper tag: :div, class: 'textfield-box' do |c|
      c.optional :label
      c.use :input,
            class: 'form-control', error_class: 'is-invalid', valid_class: false
      c.use :full_error, wrap_with: { tag: 'div', class: 'invalid-feedback' }
      c.use :hint, wrap_with: { tag: 'small', class: 'form-text text-muted' }
    end
  end

  config.wrappers(
    :inline_form_w_text_field_boxes,
    tag: 'span',
    error_class: 'form-group-invalid',
    valid_class: 'form-group-valid'
  ) do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :minlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly

    b.wrapper(tag: :div, class: 'textfield-box') do |c|
      c.use :label, class: 'sr-only'
      c.use :input,
            class: 'form-control',
            error_class: 'is-invalid',
            valid_class: 'is-valid'
      c.use :full_error, wrap_with: { tag: 'div', class: 'invalid-feedback' }
      c.optional :hint,
                 wrap_with: { tag: 'small', class: 'form-text text-muted' }
    end
  end

  # Input Group - custom component
  # see example app and config at https://github.com/rafaelfranca/simple_form-bootstrap
  config.wrappers(
    :input_group,
    tag: 'div',
    class: 'form-group',
    error_class: 'form-group-invalid',
    valid_class: 'form-group-valid'
  ) do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :minlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly
    b.optional :label

    b.wrapper(
      :input_group_tag,
      tag: 'div', class: 'input-group textfield-box'
    ) do |ba|
      ba.optional :prepend
      ba.use :input,
             class: 'form-control',
             error_class: 'is-invalid',
             valid_class: false
      ba.optional :append
      ba.use :full_error, wrap_with: { tag: 'div', class: 'invalid-feedback' }
      ba.use :hint, wrap_with: { tag: 'small', class: 'form-text text-muted' }
    end
  end

  # See: https://daemonite.github.io/material/docs/4.1/components/forms/#file-browser
  config.wrappers(
    :material_file_input,
    tag: 'div',
    class: 'custom-file',
    error_class: 'form-group-invalid',
    valid_class: 'form-group-valid'
  ) do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :minlength
    b.optional :readonly
    b.use :input, class: 'custom-file-input', error_class: 'is-invalid'
    b.use :label, class: 'custom-file-label'
    b.use :full_error, wrap_with: { tag: 'div', class: 'invalid-feedback' }
    b.use :hint, wrap_with: { tag: 'small', class: 'form-text text-muted' }
  end

  config.wrappers(
    :toggle_buttons_checkbox,
    tag: :div, class: 'btn btn-outline btn-sm'
  ) do |b|
    b.use :html5
    b.use :input
    b.use :label, class: 'pele-icons'
  end

  # The default wrapper to be used by the FormBuilder.
  config.default_wrapper = :vertical_form_w_text_field_boxes

  config.wrapper_mappings = {
    file: :material_file_input,
    toggle_buttons_checkbox: :toggle_buttons_checkbox
  }
end
