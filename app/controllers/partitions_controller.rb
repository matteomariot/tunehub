class PartitionsController < ApplicationController
  def show
    @partition = Partition.find(params[:id])
    @comment = Comment.new
    @user = User.find(Member.find(@partition.member_id).user_id)
    @comments = Comment.where(partition_id: @partition.id)
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
