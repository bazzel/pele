# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { 'john.doe@example.org' }
    role { 1 }
  end
end
