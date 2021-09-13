class SearchController < ApplicationController
  def index
  @bands = Band.all
  @songs = Song.all
  @partitions = Partition.all

    if params[:query].present?
      # bands


      # songs


    # ** IF NO QUERY **
    else
      # bands
      @user_membership = Member.where(user_id: current_user.id)

      # songs
      @bands_id = []
      @songs_member = []
      @user_membership.each do |user_membership|
        @bands_id << user_membership.band_id
      end
      Song.all.each do |song|
        if @bands_id.include?(song.band_id)
          @songs_member << song.id
        end
      end
    end
  end
end
