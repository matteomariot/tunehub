class BandsController < ApplicationController
  def index
    @bands = Band.all
    @user_bands = Member.where(user_id: current_user)
  end

  def show
    @user_bands = Member.where(user_id: current_user)
    @songs = Song.where(band_id: Member.where(user_id: current_user))
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
