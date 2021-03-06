class SongsController < ApplicationController
  before_action :set_artist

  def new
    @song = @artist.songs.build
  end

  def create
    @song = @artist.songs.build(allowed_song_params)

    if @song.save
      redirect_to artist_path(@artist), notice: "New song added!"
    else
      render :new, notice: "Something went wrong."
    end
  end

  def destroy
    Song.find(params[:id]).destroy
    redirect_to artist_path(@artist), notice: "Song deleted!"
  end

  private

  def set_artist
    @artist = Artist.find(params[:artist_id])
  end

  def allowed_song_params
    params.require(:song).permit(:name, :year)
  end
end
