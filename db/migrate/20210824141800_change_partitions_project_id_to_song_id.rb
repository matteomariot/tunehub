class ChangePartitionsProjectIdToSongId < ActiveRecord::Migration[6.1]
  def change
    rename_column :partitions, :project_id, :song_id
  end
end
