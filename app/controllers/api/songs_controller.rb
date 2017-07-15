class Api::SongsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_artist

  def index
    songs = @artist.songs
    render status: 200, json: songs
  end

  def create
    song = @artist.songs.build(allowed_song_params)

    if song.save
      render status: 201, json: song
    else
      render status: 422, json: {
        errors: song.errors
      }.to_json
    end
  end

  def destroy
    song = Song.find(params[:id])

    if song.destroy
      render status: 200, json: {
        message: "Song removed"
      }.to_json
    else
      render status: 422, json: {
        errors: song.errors
      }
    end
  end

  private

  def set_artist
    @artist = Artist.find(params[:artist_id])
  end

  def allowed_song_params
    params.require(:song).permit(:name, :year)
  end
end
