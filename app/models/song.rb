# frozen_string_literal: true

class Song < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }
end
