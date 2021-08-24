class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :content
      t.time :time
      t.references :member, null: false, foreign_key: true
      t.references :partition, null: false, foreign_key: true

      t.timestamps
    end
  end
end
