# frozen_string_literal: true

Then(
  'I expect to see the songs {string} in the group {string}'
) do |songs, group_name|
  within('.group', text: group_name) do
    song_names = songs.split(/\s*,\s*/)

    song_names.each { |song_name| expect(page).to have_content(song_name) }
  end
end
