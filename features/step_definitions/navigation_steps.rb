# frozen_string_literal: true

Given('I open the application') { visit '/' }

When('I navigate to the songs page') { visit '/songs' }

When('I navigate to the users page') do
  step 'I choose "Gebruikers" from the navigation drawer'
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
