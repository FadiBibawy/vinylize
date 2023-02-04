class CreateVinyls < ActiveRecord::Migration[7.0]
  def change
    create_table :vinyls do |t|
      t.string :artist
      t.integer :release_year
      t.string :record_title
      t.string :label
      t.string :genre
      t.string :quality
      t.float :price_per_day
      t.boolean :available
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
