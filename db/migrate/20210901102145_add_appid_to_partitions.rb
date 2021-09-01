class AddAppidToPartitions < ActiveRecord::Migration[6.1]
  def change
    add_column :partitions, :appid, :string
  end
end
