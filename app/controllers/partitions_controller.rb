class PartitionsController < ApplicationController
  def show
    @partition = Partition.find(params[:id])
    @song = Song.where(id: @partition.song_id).first
    @comment = Comment.new
    @response = Response.new
    @user = User.find(Member.find(@partition.member_id).user_id)
    @comments = Comment.where(partition_id: @partition.id)
    @band = Band.find(Song.find(params[:song_id]).band_id)
    @responses = Response.all
  end

  def new
    @partition = Partition.new
    @song = Song.find(params[:song_id])
  end

  def create
    @partition = Partition.new(partition_params)
    @partition.member = Member.where(user_id: current_user).first
    @song = Song.find(params[:song_id])
    @partition.song = @song
    if @partition.save
      redirect_to song_partition_path(@song, @partition)
    else
      render :new
    end
    @partition.save
  end

  def edit
    @partition = Partition.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private

  def partition_params
    params.require(:partition).permit(:title, :instrument, :audio)
  end
end
