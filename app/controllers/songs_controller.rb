class SongsController < ApplicationController
  before_action :find_song, only: [:show]
  def index
    @songs = Song.all
  end

  def show
    find_song
  end

  def new
    @song = Song.new
  end

  def create
  end

  def destroy
  end

  def edit
    find_song
  end

  def update
    @song.update(allowed_params)
    redirect_to song_path(@song)
  end

  private

  def allowed_params
    params.require(:songs).permit(:title, :released, :released_year, :artist_name, :genre)
  end

  def find_song
    @song = Song.find(params[:id])
  end
end
