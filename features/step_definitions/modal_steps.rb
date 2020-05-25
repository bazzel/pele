# frozen_string_literal: true

Then('I expect to see a modal for adding a new song') do
  step 'I expect to see a modal with "Een nieuw lied toevoegen" as title'
end

Then('I expect to see a modal for adding a new user') do
  step 'I expect to see a modal with "Een nieuwe gebruiker toevoegen" as title'
end

Then('I expect to see a modal for adding a new group') do
  step 'I expect to see a modal with "Een nieuwe groep toevoegen" as title'
end

Then('I expect to see a modal with {string} as title') do |title|
  within('.modal') do
    expect(page).to have_css('.modal-header h5.modal-title', text: title)
  end
end
