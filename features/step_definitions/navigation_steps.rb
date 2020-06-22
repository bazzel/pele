# frozen_string_literal: true

Given('I open the application') { visit '/' }

Given('I am on the Sign in page') { visit '/sign_in' }

When('I navigate to the home page') { step 'I open the application' }

When('I navigate to the songs page') do
  step 'I choose "Liedjes" from the navigation drawer'
end

When('I navigate to the users page') do
  step 'I choose "Gebruikers" from the navigation drawer'
end

When('I navigate to the groups page') do
  step 'I choose "Groepen" from the navigation drawer'
end

When('I navigate to {string}') { |url| visit url }

When('I use the magic link') do
  @user = User.last
  visit token_sign_in_path(@user.login_token)
end

When('I use the magic link for {string}') do |email|
  @user = User.find_by(email: email)
  visit token_sign_in_path(@user.login_token)
end

Then('I expect to be redirected to the sign in page') do
  step 'I expect to see the sign in page'
end

When('I choose {string} from the navigation drawer') do |menu|
  step 'I open the application'
  step 'I open the navigation drawer'

  within('.navdrawer-nav') do
    # Menu items also contain an icon that are displayed as text
    # so we need to use a regex.
    find('a', text: /#{menu}/).click
  end
end

When('I scroll to the bottom of the page') do
  script = <<-JS
  window.scrollTo(0, document.body.scrollHeight);
  JS

  page.execute_script(script)
end

Given('I open the navigation drawer') do
  find('nav button.navbar-toggler').click
end

Then('I expect not to see a {string} menu-item') do |menu_item|
  within('.navdrawer-nav') { expect(page).not_to have_content(menu_item) }
end

Given('I hover over the item {string}') do |item_text|
  find('.list-group-item', text: item_text).hover
end
