# frozen_string_literal: true

#:nodoc:
class Lesson < ApplicationRecord
  belongs_to :song
  belongs_to :group

  def song_title
    @song_title ||= song&.title
  end

  attr_writer :song_title
end
