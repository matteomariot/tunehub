class MembersController < ApplicationController
  def index
    @members = Member.where(band_id: params[:band_id])
    @users = User.all
    @band_owner = Band.find(params[:band_id]).user_id
    @band = Band.find(params[:band_id])
  end

  def new
    @member = Member.new()
    @band = Band.find(params[:band_id])
  end

  def create
    @member = Member.new(member_params)
    @band = Band.find(params[:band_id])
    @member.band = @band
    if @member.save
      redirect_to edit_band_path(params[:band_id])
    else
      render :new
    end
  end

  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    redirect_to edit_band_path(params[:band_id])
  end

  private

  def member_params
    params.require(:member).permit(:user_id)
  end
end
