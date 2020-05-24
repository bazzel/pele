# frozen_string_literal: true
Given('I open the application') { visit '/' }

When('I navigate to the songs page') { visit '/songs' }

When('I choose {string} from the navigation drawer') do |menu|
  step 'I open the application'
  find('nav button.navbar-toggler').click

  within('.navdrawer-nav') do
    # Menu items also contain an icon that are displayed as text
    # so we need to use a regex.
    find('a', text: /#{menu}/).click
  end
end
