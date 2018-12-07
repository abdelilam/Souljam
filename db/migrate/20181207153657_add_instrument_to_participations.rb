class AddInstrumentToParticipations < ActiveRecord::Migration[5.2]
  def change
    add_reference :participations, :instrument, foreign_key: true
  end
end
