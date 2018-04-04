class CreatePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :pictures do |t|
      t.string :title
      t.string :content_url
      t.string :location
      t.references :wall, foreign_key: true

      t.timestamps
    end
  end
end
