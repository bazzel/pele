# frozen_string_literal: true

#:nodoc:
class Group < ApplicationRecord
  include Discard::Model

  has_and_belongs_to_many :students, class_name: 'User'

  validates :name, presence: true, length: { maximum: 100 }

  before_validation :set_students

  def student_names
    @student_names ||= students.map(&:name)
  end

  def student_names=(value)
    @student_names = parse_tagify_json(value)
  rescue StandardError
    @student_names = value.split(/,\s*/)
  end

  private

  def set_students
    return if @student_names.nil?

    self.students =
      @student_names.map do |name|
        student = User.find_by(name: name, role: User.roles[:student])

        if student.nil?
          errors.add(:student_names, :invalid)
          return nil
        end

        student
      end
  end

  def parse_tagify_json(value)
    JSON.parse(value).map { |h| h['value'] }
  end
end
