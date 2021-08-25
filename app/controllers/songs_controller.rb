class SongsController < ApplicationController
  def show
    @partitions = Partition.where(song_id: Song.find(params[:id]).id)
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
