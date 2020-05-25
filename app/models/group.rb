# frozen_string_literal: true

#:nodoc:
class Group < ApplicationRecord
  include Discard::Model

  validates :name, presence: true, length: { maximum: 100 }
end
