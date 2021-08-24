class RenameOldTableToNewTable < ActiveRecord::Migration[6.1]
  def change
    rename_table :projects, :songs
  end
end
