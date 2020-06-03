# frozen_string_literal: true

#:nodoc:
class Song < ApplicationRecord
  include Discard::Model

  validates :title, presence: true, length: { maximum: 255 }

  has_many :scores, dependent: :destroy
  has_many :pins, as: :pinnable, dependent: :destroy

  accepts_nested_attributes_for :scores,
                                reject_if: lambda { |attributes|
                                  attributes['attachment'].blank? &&
                                    attributes['attachment_cache'].blank?
                                },
                                allow_destroy: true

  scope :pinned_by, ->(user) { joins(:pins).merge(user.pins) }
end
