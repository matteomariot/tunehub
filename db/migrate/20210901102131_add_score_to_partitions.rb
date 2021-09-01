class AddScoreToPartitions < ActiveRecord::Migration[6.1]
  def change
    add_column :partitions, :score, :string
  end
end
