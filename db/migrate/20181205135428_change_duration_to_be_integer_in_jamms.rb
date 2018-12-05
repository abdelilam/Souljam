class ChangeDurationToBeIntegerInJamms < ActiveRecord::Migration[5.2]
  def change
    remove_column :jamms, :duration
    add_column :jamms, :duration, :integer, default: 1
  end
end
