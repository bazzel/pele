# frozen_string_literal: true

FactoryBot.define do
  factory :group do
    name { 'MyString' }
    teacher factory: :user
  end
end
