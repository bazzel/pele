# frozen_string_literal: true

# Given('I have {int} songs') { |songs_count| create_list(:song, songs_count) }

# When('I click( the) {string}( button)') { |label| click_on label }

Given('I am adding a new group') do
  step 'I navigate to the groups page'
  step 'I click the "add" button'
end

Given('I am editing the group {string}') do |group_name|
  step 'I navigate to the groups page'
  step "I hover over the group \"#{group_name}\""
  step 'I click the "create" button'
end

Given('I have created the following group(s):') do |table|
  table.map_column!('teacher', false) { |t| User.teacher.find_by(email: t) }
  table.map_column!('students', false) do |s|
    User.where(email: s.split(/\s*,\s*/))
  end

  table.hashes.each { |hash| create(:group, hash) }
end

Given('I hover over the group {string}') do |group_name|
  step "I hover over the item \"#{group_name}\""
end

When('I add the students {string}') do |text|
  student_names = text.split(/\s*,\s*/)

  student_names.each do |name|
    within('form .group_student_ids') do
      el = find('.tagify__input')
      el.set("#{name}\n")
      el.send_keys(:enter)
    end
  end
end

When('I add the song {string}') do |song_title|
  within('.form-group', text: 'Lessen') do
    click_on('Les toevoegen')
    field = all('.nested-fields').last
    within(field) do
      input_field = page.find('input')
      input_field.fill_in(with: song_title)
      sleep 0.3
      within('ul.autocomplete-result-list') do
        find('li', text: song_title).click
      end
    end
  end
end

Then('I expect to see a page for adding a new group') do
  expect(current_path).to eql('/groups/new')
  expect(page).to have_content('Een nieuwe groep toevoegen')

  within('form') { expect(page).to have_button('Opslaan') }
end

Then('I expect to see a page for editing the group') do
  expect(current_path).to match(%r{/groups/.*/edit})

  within('form') { expect(page).to have_button('Opslaan') }
end

Then(
  'I expect to see the song(s) {string} have been added to the group {string}'
) do |songs, group_name|
  step "I expand the panel for \"#{group_name}\""

  song_names = songs.split(/\s*,\s*/)

  song_names.each { |song_name| expect(page).to have_content(song_name) }
end
