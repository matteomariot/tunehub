class ResponsesController < ApplicationController
  def create
    @response = Response.new(response_params)
    @response.user = current_user
    @comment = Comment.find(params[:comment_id])
    @response.comment = @comment
    @partition = Partition.find(Comment.find(@response.comment_id).partition_id)
    if @response.save
      redirect_to song_partition_path(@partition.song_id, @partition.id)
    else
      render :create
    end
  end

  private

  def response_params
    params.require(:response).permit(:content)
  end
end
