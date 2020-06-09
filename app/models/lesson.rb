# frozen_string_literal: true

#:nodoc:
class Lesson < ApplicationRecord
  belongs_to :song
  belongs_to :group
  has_many :pins, as: :pinnable, dependent: :destroy

  ransack_alias :title, :song_title
  ransack_alias :title_or_songwriter_name, :song_title_or_song_songwriter_name
  ransack_alias :tags_id, :song_tags_id
  ransack_alias :scores_tablature_notation, :song_scores_tablature_notation
  ransack_alias :scores_standard_notation, :song_scores_standard_notation
  ransack_alias :scores_chord_notation, :song_scores_chord_notation

  scope :pinned_by, ->(user) { merge(user.pins) }

  def song_title
    @song_title ||= song&.title
  end

  attr_writer :song_title
end
