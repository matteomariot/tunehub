class PartitionsController < ApplicationController
  def show
    @partition = Partition.find(params[:id])
    @song = Song.where(id: @partition.song_id).first
    @comment = Comment.new
    @response = Response.new
    @user = User.find(Member.find(@partition.member_id).user_id)
    @comments = Comment.where(partition_id: @partition.id)
    @band = Band.find(Song.find(params[:song_id]).band_id)
    @responses = Response.where(comment_id: @comments.first.id)
  end

  def new

  end

  def create
  end

  def edit
    @partition = Partition.find(params[:id])
  end

  def update
  end

  def destroy
  end
end
