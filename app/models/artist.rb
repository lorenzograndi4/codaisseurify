class Artist < ApplicationRecord
  has_many :songs, dependent: :destroy

  validates :name, :bio, :genre, presence: true
end
