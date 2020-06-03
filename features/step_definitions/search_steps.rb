# frozen_string_literal: true

When('I switch the pin button on') do
  script = <<-JS
  document.querySelector('label[for="pinned"]').click();
  JS

  page.execute_script(script)
end
