class SongSerializer < ActiveModel::Serializer
  # belongs_to :artist
  attributes :id, :name, :year, :artist_id
end
