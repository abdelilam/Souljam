class RemoveCreatorFromParticipations < ActiveRecord::Migration[5.2]
  def change
    remove_column :participations, :creator
  end
end
