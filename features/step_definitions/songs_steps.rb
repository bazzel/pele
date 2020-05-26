# frozen_string_literal: true

Given('I have {int} songs') { |songs_count| create_list(:song, songs_count) }

When('I click( the) {string}( button)') { |label| click_on label }

Given('I am adding a new song') do
  step 'I navigate to the songs page'
  step 'I click the "add" button'
end

Given('I have created the following song(s):') do |table|
  table.hashes.each { |hash| create(:song, hash) }
end

Given('I hover over the song {string}') do |song_title|
  step "I hover over the item \"#{song_title}\""
end
