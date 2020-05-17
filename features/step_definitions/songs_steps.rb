Given('I have {int} songs') { |int| int.times { Song.create(title: 'Alive') } }

When('I navigate to the songs page') { visit '/songs' }

Then('I expect to see {int} songs') do |int|
  expect(page).to have_css('li', count: int)
end
