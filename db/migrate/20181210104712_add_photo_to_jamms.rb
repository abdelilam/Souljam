class AddPhotoToJamms < ActiveRecord::Migration[5.2]
  def change
    add_column :jamms, :photo, :string
  end
end
