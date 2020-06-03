# frozen_string_literal: true

#:nodoc:
class Pin < ApplicationRecord
  belongs_to :pinnable, polymorphic: true
  belongs_to :user

  def song
    pinnable.is_a?(Lesson) ? pinnable.song : pinnable
  end
end
