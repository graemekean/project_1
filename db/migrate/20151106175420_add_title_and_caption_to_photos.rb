class AddTitleAndCaptionToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :title, :string
    add_column :photos, :caption, :string
  end
end
