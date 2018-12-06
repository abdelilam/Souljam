class ChangeLevelToBeStringInSkills < ActiveRecord::Migration[5.2]
  def change
    change_column :skills, :level, :string
  end
end
