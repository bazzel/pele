# frozen_string_literal: true

When('I undo deleting the group/song') do
  within('.snackbar.show') { click_on('Ongedaan maken') }
end

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
