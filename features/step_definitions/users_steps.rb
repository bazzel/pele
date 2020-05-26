# frozen_string_literal: true

Given('I am adding a new user') do
  step 'I navigate to the users page'
  step 'I click the "add" button'
end

Given('I have created the following user(s):') do |table|
  table.hashes.each { |hash| create(:user, hash) }
end

Given('I hover over the user {string}') do |user_name|
  step "I hover over the item \"#{user_name}\""
end
