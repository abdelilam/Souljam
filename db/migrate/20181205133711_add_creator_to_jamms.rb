class AddCreatorToJamms < ActiveRecord::Migration[5.2]
  def change
    add_column :jamms, :creator_id, :integer, index: true
    add_foreign_key :jamms, :users, column: :creator_id
  end
end
