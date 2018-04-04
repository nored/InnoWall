class AddOwnerTokenToWall < ActiveRecord::Migration[5.1]
  def change
    add_column :walls, :ownertoken, :string
  end
end
