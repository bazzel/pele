FactoryBot.define do
  factory :song do
    title { Faker::Lorem.sentence }
  end
end
