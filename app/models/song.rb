# frozen_string_literal: true

#:nodoc:
class Song < ApplicationRecord
  include Discard::Model

  validates :title, presence: true, length: { maximum: 255 }

  has_many :scores, dependent: :destroy
  has_many :pins, as: :pinnable, dependent: :destroy
  belongs_to :songwriter, optional: true

  accepts_nested_attributes_for :scores,
                                reject_if: lambda { |attributes|
                                  attributes['attachment'].blank? &&
                                    attributes['attachment_cache'].blank?
                                },
                                allow_destroy: true

  scope :pinned_by, ->(user) { joins(:pins).merge(user.pins) }

  before_validation :set_songwriter

  delegate :name, to: :songwriter, prefix: true, allow_nil: true

  acts_as_taggable

  def songwriter_title
    @songwriter_title ||= songwriter&.name
  end

  attr_writer :songwriter_title

  def tag_list=(value)
    arr = parse_tagify_json(value)
    super(arr)
  rescue StandardError
    super
  end

  private

  def set_songwriter
    return if songwriter_title.blank?

    self.songwriter = Songwriter.find_or_create_by(name: songwriter_title)
  end

  def parse_tagify_json(value)
    JSON.parse(value).map { |h| h['value'] }
  end
end
