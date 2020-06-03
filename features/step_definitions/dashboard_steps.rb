# frozen_string_literal: true

Then(
  'I expect to see the song(s) {string} in the group {string}'
) do |songs, group_name|
  within('.group', text: group_name) do
    song_names = songs.split(/\s*,\s*/)

    song_names.each { |song_name| expect(page).to have_content(song_name) }
  end
end

Then('I expect not to see the song(s) {string} in any group') do |songs|
  song_names = songs.split(/\s*,\s*/)

  song_names.each { |song_name| expect(page).not_to have_content(song_name) }
end

Then('I expect to see the song(s) {string} as pinned') do |songs|
  song_names = songs.split(/\s*,\s*/)

  within('.pinned') do
    song_names.each { |song_name| expect(page).to have_content(song_name) }
  end
end
