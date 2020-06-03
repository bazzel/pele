# frozen_string_literal: true

FactoryBot.define do
  factory :score do
    song { nil }
    attachment do
      Rack::Test::UploadedFile.new(
        Rails.root.join('spec/files/score.pdf'),
        'application/pdf'
      )
    end
  end
end
