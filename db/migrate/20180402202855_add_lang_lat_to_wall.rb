class AddLangLatToWall < ActiveRecord::Migration[5.1]
  def change
    add_column :walls, :latitude, :float
    add_column :walls, :longitude, :float
  end
end
