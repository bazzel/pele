# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }
    name { Faker::Name.name }
    role { User.roles[:student] }

    login_token { Faker::Config.random.seed }

    login_token_valid_until { 15.minutes.from_now }

    trait :student do
      role { User.roles[:student] }
    end

    trait :teacher do
      role { User.roles[:teacher] }
    end

    trait :admin do
      role { User.roles[:admin] }
    end
  end
end
