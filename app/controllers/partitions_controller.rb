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
    # @partition.member = Member.where(user_id: current_user).first
    @song = Song.find(params[:song_id])
    @partition.song = @song
    @partition.score = "612f3f9ba11079001488b668"
    @partition.appid = "612de5048b4cfc0013a41f0a"
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
    @song = Song.find(params[:song_id])
    @partition = Partition.find(params[:id])
    @partition.update(partition_params)
    redirect_to song_partition_path(@song, @partition)
  end

  def destroy
  end

  private

  def partition_params
    params.require(:partition).permit(:title, :instrument, :member_id, :audio)
  end
end
