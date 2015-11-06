class AddPhotoImageToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :photo_image, :string
  end
end
