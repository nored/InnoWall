class CreateVideos < ActiveRecord::Migration[5.1]
  def change
    create_table :videos do |t|
      t.string :title
      t.string :yt_id
      t.string :location
      t.references :wall, foreign_key: true

      t.timestamps
    end
  end
end
