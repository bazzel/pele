# frozen_string_literal: true

#:nodoc:
class Group < ApplicationRecord
  include Discard::Model

  has_and_belongs_to_many :students, class_name: 'User'

  validates :name, presence: true, length: { maximum: 100 }

  def student_ids=(value)
    super(parse_tagify_json(value))
  rescue StandardError
    super(value)
  end

  private

  def parse_tagify_json(value)
    JSON.parse(value).map { |h| h['id'] }
  end
end
