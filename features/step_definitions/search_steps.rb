# frozen_string_literal: true

When('I switch the pin button on') do
  script = <<-JS
  document.querySelector('label[for="pinned"]').click();
  JS

  page.execute_script(script)
end

When('I search for songs tagged with {string}') do |text|
  tags = text.split(/\s*,\s*/)
  click_on('Labels')

  tags.each { |tag| within('.tags') { find('label', text: tag).click } }
end

When('I search for songs with notation {string}') do |text|
  notations = text.split(/\s*,\s*/)

  within('.search-form form') do
    notations.each { |notation| find('label', text: notation).click }
  end
end

Then('I see the search form displaying {string}') do |text|
  within('.search-form form') do
    expect(page).to have_css('.filter-button', text: /#{text}/i)
  end
end
