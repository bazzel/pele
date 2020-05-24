# frozen_string_literal: true

#:nodoc:
class User < ApplicationRecord
  include Discard::Model

  enum role: { admin: 0, teacher: 1, student: 2 }

  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { maximum: 255 },
            email: true
  # validates :name, presence: true, length: { maximum: 255 }
  validates :role, presence: true
end
