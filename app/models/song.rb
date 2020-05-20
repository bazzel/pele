# frozen_string_literal: true

#:nodoc:
class Song < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }
end
