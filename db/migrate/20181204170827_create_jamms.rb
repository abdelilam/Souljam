class CreateJamms < ActiveRecord::Migration[5.2]
  def change
    create_table :jamms do |t|
      t.string :title
      t.text :description
      t.string :location
      t.date :date
      t.time :duration
      t.integer :capacity

      t.timestamps
    end
  end
end
