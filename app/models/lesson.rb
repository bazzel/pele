# frozen_string_literal: true

#:nodoc:
class Lesson < ApplicationRecord
  belongs_to :song
  belongs_to :group
  has_many :pins, as: :pinnable, dependent: :destroy

  ransack_alias :title, :song_title

  scope :pinned_by, ->(user) { merge(user.pins) }

  def song_title
    @song_title ||= song&.title
  end

  attr_writer :song_title
end
