class CreateWalls < ActiveRecord::Migration[5.1]
  def change
    create_table :walls do |t|
      t.string :url
      t.integer :delete_after
      t.boolean :allow_pictures
      t.boolean :allow_videos
      t.boolean :allow_text
      t.boolean :restrict_location

      t.timestamps
    end
  end
end
