# frozen_string_literal: true

#:nodoc:
class Song < ApplicationRecord
  include Discard::Model

  validates :title, presence: true, length: { maximum: 255 }
end
