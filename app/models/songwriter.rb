# frozen_string_literal: true

#:nodoc:
class Songwriter < ApplicationRecord
  has_many :songs, dependent: :nullify
end
