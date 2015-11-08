class Photo < ActiveRecord::Base
  belongs_to :album
  belongs_to :user
  has_many :comments


  mount_uploader :photo_image, PhotoImageUploader

end
