# frozen_string_literal: true

#:nodoc:
class User < ApplicationRecord
  include Discard::Model

  enum role: { admin: 0, teacher: 1, student: 2 }

  has_and_belongs_to_many :groups # rubocop:disable Rails/HasAndBelongsToMany:

  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { maximum: 255 },
            email: true
  validates :role, presence: true

  def self.valid_with_token(token)
    where(login_token: token).find_by(
      'login_token_valid_until > ?',
      Time.zone.now
    )
  end

  def anonymous?
    false
  end

  def identified?
    !anonymous?
  end

  def invalidate_token
    update!(login_token: nil, login_token_valid_until: 1.year.ago)
  end
end
