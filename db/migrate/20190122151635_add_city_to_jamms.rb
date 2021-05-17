class AddCityToJamms < ActiveRecord::Migration[5.2]
  def change
    add_column :jamms, :city, :string
  end
end
