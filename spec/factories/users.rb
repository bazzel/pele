# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'MyString' }
    role { 1 }
  end
end
