# frozen_string_literal: true

Given('I have {int} songs') { |songs_count| create_list(:song, songs_count) }

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

When('I add the songwriter {string}') do |songwriter_name|
  step "I fill in \"Componist\" with \"#{songwriter_name}\""
end

When('I add the tags {string}') do |text|
  tags = text.split(/\s*,\s*/)

  tags.each do |tag|
    within('form .song_tag_list') do
      el = find('.tagify__input')
      el.set("#{tag}\n")
      el.send_keys(:enter)
    end
  end
end

Then('I expect to see a page for adding a new song') do
  expect(current_path).to eql('/songs/new')
  expect(page).to have_content('Een nieuw lied toevoegen')

  within('form') { expect(page).to have_button('Opslaan') }
end

Then('I expect to see a page for editing the song') do
  expect(current_path).to match(%r{/songs/.*/edit})

  within('form') { expect(page).to have_button('Opslaan') }
end

Then(
  'I expect to see the tags {string} for the song {string}'
) do |text, song_title|
  tags = text.split(/\s*,\s*/)

  within('.list-group-item', text: song_title) do
    tags.each { |tag| expect(page).to have_content(tag) }
  end
end
