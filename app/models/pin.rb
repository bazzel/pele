# frozen_string_literal: true

#:nodoc:
class Pin < ApplicationRecord
  belongs_to :song
  belongs_to :user
end
