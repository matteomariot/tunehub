class BandsController < ApplicationController

  def index
    @bands = Band.all
  end


  def show
    @songs = Song.where(band_id: Member.where(user_id: current_user))
  end

  def new
    @band = Band.new
  end

  def create
    @band = Band.new(band_params)
    @band.user_id = current_user.id
    @band.save
    redirect_to bands_path(@band)
  end

  def show
    @songs = Song.where(band_id: Band.find(params[:id]).id)
  end

  def edit
    @band = Band.find(params[:id])
  end

  def update
    @band = Band.find(params[:id])
    @band.update(band_params)

    # no need for app/views/restaurants/update.html.erb
    redirect_to band_path(@band)
  end

  def destroy
  end

  private

  def band_params
    params.require(:band).permit(:name)
  end
end
