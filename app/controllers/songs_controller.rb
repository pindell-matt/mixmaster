class SongsController < ApplicationController

  def new
    @artist = Artist.find(params[:artist_id])
    @song   = @artist.songs.new
  end

  def index
    if params.include?(:artist_id)
      @artist = Artist.find(params[:artist_id])
      @songs  = @artist.songs
    else
      @songs = Song.all
    end
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
    @song = Song.find(params[:id])
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])

    if @song.update(song_params)
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  private

  def song_params
    params.require(:song).permit(:title)
  end

end
