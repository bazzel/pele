# frozen_string_literal: true

FactoryBot.define do
  factory :song do
    transient { scores_count { rand(6) } }

    title { Faker::Music::PearlJam.song }

    after(:create) do |song, evaluator|
      create_list(:score, evaluator.scores_count, song: song)
    end
  end
end
