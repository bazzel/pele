# frozen_string_literal: true

Given('I fill in {string} with {string}') do |label, value|
  label_to_placeholder_mapping = { 'Titel' => 'title' }

  find("[name$='[#{label_to_placeholder_mapping[label]}]']").fill_in with: value
end
