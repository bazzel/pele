# frozen_string_literal: true

# Given('I have {int} songs') { |songs_count| create_list(:song, songs_count) }

# When('I click( the) {string}( button)') { |label| click_on label }

Given('I am adding a new group') do
  step 'I navigate to the groups page'
  step 'I click the "add" button'
end

Given('I have created the following group(s):') do |table|
  table.map_column!('teacher', false) { |t| User.teacher.find_by(email: t) }
  table.hashes.each { |hash| create(:group, hash) }
end

Given('I hover over the group {string}') do |group_title|
  step "I hover over the item \"#{group_title}\""
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
