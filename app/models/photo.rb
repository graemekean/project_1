class Photo < ActiveRecord::Base
  belongs_to :album


  mount_uploader :photo_image, PhotoImageUploader

end
