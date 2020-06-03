# frozen_string_literal: true

#:nodoc:
class Pin < ApplicationRecord
  belongs_to :pinnable, polymorphic: true
  belongs_to :user
end
