class User < ApplicationRecord
  include Discard::Model

  enum role: { admin: 0, teacher: 1, student: 2 }

  validates :name, presence: true, length: { maximum: 255 }
  validates :role, presence: true
end
