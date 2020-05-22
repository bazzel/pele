# frozen_string_literal: true

#:nodoc:
class Song < ApplicationRecord
  include Discard::Model

  validates :title, presence: true, length: { maximum: 255 }

  has_many :scores

  accepts_nested_attributes_for :scores,
                                reject_if: lambda { |attributes|
                                  attributes['file'].nil?
                                },
                                allow_destroy: true
end
