class CreateSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :skills do |t|
      t.integer :level
      t.references :user, foreign_key: true
      t.references :instrument, foreign_key: true

      t.timestamps
    end
  end
end
