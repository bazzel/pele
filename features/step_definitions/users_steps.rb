# frozen_string_literal: true

Given('I am adding a new user') do
  step 'I navigate to the users page'
  step 'I click the "add" button'
end

Given('I have created the following user(s):') do |table|
  table.hashes.each { |hash| create(:user, hash) }
end

Then('I expect to see {int} user(s)') do |users_count|
  expect(page).to have_css('div.list-group-item', count: users_count)
end

Given('I hover over the user {string}') do |user_name|
  step "I hover over the item \"#{user_name}\""
end
