class Song < ApplicationRecord
  belongs_to :artist

  validates :name, :year, :artist, presence: true
end
