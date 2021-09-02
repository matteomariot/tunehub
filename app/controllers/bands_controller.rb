class BandsController < ApplicationController
  def index
    @members = Member.all
  end

  def show
    @band = Band.find(params[:id])
    @songs = Song.where(band_id: Band.find(params[:id]).id)
  end

  def new
    @band = Band.new
    @member = Member.new()
  end

  def create
    # **  BAND CREATION **
    @band = Band.new(band_params)
    @band.user_id = current_user.id
    @band.save
    if @band.save
      # ** CREATION MEMBER **
      @member = Member.new()
      @member.user_id = current_user.id
      @member.band_id = @band.id
      @member.save

      # ** REDIRECT TO DASHBOARD **
      redirect_to bands_path()
    else
      render :new
    end
  end

  def edit
    @band = Band.find(params[:id])
    @members = Member.where(band_id: @band)
    @users = User.all
  end

  def update
    @band = Band.find(params[:id])
    @band.update(band_params)
    redirect_to band_path(@band)
  end

  def destroy
    @band = Band.find(params[:id])
    @band.destroy
    redirect_to bands_path
  end

  private

  def band_params
    params.require(:band).permit(:name, :photo)
  end
end
