class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :album_id
      t.string :date_uploaded
      t.boolean :favourite
      t.decimal :rating

      t.timestamps null: false
    end
  end
end
