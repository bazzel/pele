# frozen_string_literal: true

Given('I have {int} songs') { |songs_count| create_list(:song, songs_count) }

Then('I expect to see {int} song(s)') do |songs_count|
  expect(page).to have_css('li', count: songs_count)
end

When('I click( the) {string}( button)') { |label| click_on label }

Given('I am adding a new song') do
  step 'I navigate to the songs page'
  step 'I click the "add" button'
end
