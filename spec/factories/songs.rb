# frozen_string_literal: true

FactoryBot.define do
  factory :song do
    transient { scores_count { rand(6) } }

    title { Faker::Music::PearlJam.song }
    songwriter
    tag_list { [Faker::Music.instrument, Faker::Music.genre] }

    after(:create) do |song, evaluator|
      create_list(:score, evaluator.scores_count, song: song)
    end
  end
end
