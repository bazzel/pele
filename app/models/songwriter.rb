class Songwriter < ApplicationRecord
  has_many :songs

  ransack_alias :title, :name
end
