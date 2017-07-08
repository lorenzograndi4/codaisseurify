class Artist < ApplicationRecord
  has_many :songs

  validates :name, :bio, :genre, presence: true
end
