class CreatePartitions < ActiveRecord::Migration[6.1]
  def change
    create_table :partitions do |t|
      t.string :title
      t.string :instrument
      t.references :project, null: false, foreign_key: true
      t.references :member, null: false, foreign_key: true

      t.timestamps
    end
  end
end
