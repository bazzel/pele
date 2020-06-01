# frozen_string_literal: true

When('I undo deleting the group/song') do
  within('.snackbar.show') { click_on('Ongedaan maken') }
end

When('I click( the) {string}( button)') { |label| click_on label }

Then('I expect to see {int} user(s)/song(s)/group(s)') do |items_count|
  expect(page).to have_css('div.list-group-item', count: items_count)
end

Then("I'm in") do
  expect(current_path).to eql('/')

  within('nav') { expect(page).to have_text(@user.email) }

  # expect(page).to have_link('add')
end

Then("I'm out") do
  step 'I am on the Sign in page'

  # expect(page).to have_text('Je bent nu afgemeld.')
  expect(page).not_to have_button('add')
end

Then('I expect to see a message that I am not authorized') do
  expect(page).to have_text('Je hebt niet voldoende rechten.')
end

Then('I expect not to see the {string} button') do |label|
  expect(page).not_to have_link(label)
end
