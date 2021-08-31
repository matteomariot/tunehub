class SongsController < ApplicationController

  def new
    @song = Song.new
    @band = Band.find(params[:band_id])
  end

  def create
    @song = Song.new(song_params)
    @band = Band.find(params[:band_id])
    @song.band = Band.find(params[:band_id])
    if @song.save
      redirect_to band_song_path(@band, @song)
    else
      render :new
    end
    @song.save
  end

  def show
    @partitions = Partition.where(song_id: Song.find(params[:id]).id)
    @song = Song.find(params[:id])
    @band = Band.find(params[:band_id])
  end

  def edit
    @song = Song.find(params[:id])
    @band = Band.find(params[:band_id])
  end

  def update
    @band = Band.find(params[:band_id])
    @song = Song.find(params[:id])
    @song.update(song_params)
    redirect_to band_song_path(@band, @song)
  end

  def destroy
  end

  private

  def song_params
    params.require(:song).permit(:name, :description)
  end
end
