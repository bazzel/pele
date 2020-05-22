class Score < ApplicationRecord
  belongs_to :song

  has_one_attached :file
end
