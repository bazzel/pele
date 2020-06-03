# frozen_string_literal: true

FactoryBot.define do
  factory :song do
    title { Faker::Music.album }
  end
end
