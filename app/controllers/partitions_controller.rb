class PartitionsController < ApplicationController
  def show
    @partition = Partition.find(params[:id])
    @user = User.find(Member.find(@partition.member_id).user_id)
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
