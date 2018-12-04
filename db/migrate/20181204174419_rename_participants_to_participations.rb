class RenameParticipantsToParticipations < ActiveRecord::Migration[5.2]
  def change
    rename_table :participants, :participations
  end
end
