class AddLinkToPartitions < ActiveRecord::Migration[6.1]
  def change
    add_column :partitions, :link, :string
  end
end
