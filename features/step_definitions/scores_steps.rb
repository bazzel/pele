# frozen_string_literal: true

Given('I have created the following scores:') do |table|
  table.map_column!('song') { |s| Song.find_by(title: s) }
  table.map_column!('tablature_notation', false) do |n|
    ActiveModel::Type::Boolean.new.cast(n)
  end
  table.map_column!('standard_notation', false) do |n|
    ActiveModel::Type::Boolean.new.cast(n)
  end
  table.map_column!('chord_notation', false) do |n|
    ActiveModel::Type::Boolean.new.cast(n)
  end
  table.hashes.each { |hash| create(:score, hash) }
end
