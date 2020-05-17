# frozen_string_literal: true

Given('I have {int} songs') { |songs_count| create_list(:song, songs_count) }

When('I navigate to the songs page') { visit '/songs' }

Then('I expect to see {int} songs') do |songs_count|
  expect(page).to have_css('li', count: songs_count)
end
