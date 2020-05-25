# frozen_string_literal: true

Given('I open the application') { visit '/' }

Given('I am on the Sign in page') { visit '/sign_in' }

When('I navigate to the songs page') do
  step 'I choose "Liedjes" from the navigation drawer'
end

When('I navigate to the users page') do
  step 'I choose "Gebruikers" from the navigation drawer'
end

When('I navigate to the groups page') do
  step 'I choose "Groepen" from the navigation drawer'
end

When('I use the magic link') do
  @user = User.last
  visit token_sign_in_path(@user.login_token)
end

Then('I expect to be redirected to the sign in page') do
  step 'I expect to see the sign in page'
end

When('I choose {string} from the navigation drawer') do |menu|
  step 'I open the application'
  find('nav button.navbar-toggler').click

  within('.navdrawer-nav') do
    # Menu items also contain an icon that are displayed as text
    # so we need to use a regex.
    find('a', text: /#{menu}/).click
  end
end

Given('I hover over the item {string}') do |item_text|
  find('.list-group-item', text: item_text).hover
end
