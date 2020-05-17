# frozen_string_literal: true

Given('I have {int} songs') { |songs_count| create_list(:song, songs_count) }

When('I navigate to the songs page') { visit '/songs' }

Then('I expect to see {int} songs') do |songs_count|
  expect(page).to have_css('li', count: songs_count)
end

When('I click( the) {string}( button)') { |label| click_on label }

Then('I expect to see a modal for adding a new song') do
  step 'I see a modal with "Een nieuw lied toevoegen" as title'
end

Then('I see a modal with {string} as title') do |title|
  within('.modal') do
    expect(page).to have_css('.modal-header h5.modal-title', text: title)
  end
end
