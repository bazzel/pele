# frozen_string_literal: true

FactoryBot.define do
  factory :song do
    title { Faker::Lorem.sentence }
  end
end
