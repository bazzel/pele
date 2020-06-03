# frozen_string_literal: true

FactoryBot.define do
  factory :group do
    name { Faker::Team.name }
    teacher factory: :user
  end
end
