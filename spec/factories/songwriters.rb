# frozen_string_literal: true

FactoryBot.define do
  factory :songwriter do
    name { Faker::FunnyName.name }
  end
end
