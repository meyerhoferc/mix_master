class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      redirect_to artist_path(@artist)
    else
      render :new
    end
  end

  def show
    set_artist
  end

  def edit
    set_artist
  end

  def update
    set_artist
    if @artist.update(artist_params)
      redirect_to artist_path(@artist)
    else
      render :edit
    end
  end

  def destroy
    Artist.destroy(params[:id])

    redirect_to artists_path
  end

  private

  def set_artist
    @artist = Artist.find(params[:id])
  end

  def artist_params
    params.require(:artist).permit(:name, :image_path)
  end
end
