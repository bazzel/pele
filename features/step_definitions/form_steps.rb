# frozen_string_literal: true

Given('I fill in {string} with {string}') do |label, value|
  label_to_placeholder_mapping = {
    'Titel' => 'title', 'Naam' => 'name', 'E-mailadres' => 'email'
  }

  find("[name$='[#{label_to_placeholder_mapping[label]}]']").fill_in with: value
end

When('I choose {string} as "Rol"') { |value| select(value, from: 'user[role]') }
