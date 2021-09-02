class PartitionChannel < ApplicationCable::Channel
  def subscribed
    partition = Partition.find(params[:id])
    stream_for partition
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
