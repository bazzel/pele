# frozen_string_literal: true

Given('I am adding a new user') do
  step 'I choose "Gebruikers" from the navigation drawer'
  step 'I click the "add" button'
end

Then('I expect to see {int} user(s)') do |users_count|
  expect(page).to have_css('div.list-group-item', count: users_count)
end
