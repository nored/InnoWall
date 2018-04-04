class CreateTexts < ActiveRecord::Migration[5.1]
  def change
    create_table :texts do |t|
      t.string :title
      t.text :content
      t.string :location
      t.references :wall, foreign_key: true

      t.timestamps
    end
  end
end
