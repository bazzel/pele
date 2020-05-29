# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }
    role { 1 }

    login_token { Faker::Config.random.seed }

    login_token_valid_until { 15.minutes.from_now }
  end
end
