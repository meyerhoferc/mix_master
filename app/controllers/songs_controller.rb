class SongsController < ApplicationController
  def new
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.new
  end

  def index
    @songs = Song.where(artist_id: params[:artist_id])
  end

  def create
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.new(song_params)
    if @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def show
    set_song
  end

  def edit
    set_song
  end

  def update
    set_song
    if @song.update(song_params)
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  private

  def set_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:title)
  end
end
