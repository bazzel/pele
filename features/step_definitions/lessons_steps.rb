# frozen_string_literal: true

Given('I have create the following lessons:') do |table|
  table.map_column!('group') { |g| Group.find_by(name: g) }
  table.map_column!('song') { |s| Song.find_by(title: s) }
  table.hashes.each { |hash| create(:lesson, hash) }
end
