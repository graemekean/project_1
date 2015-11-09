class Photo < ActiveRecord::Base
  belongs_to :album
  belongs_to :user
  has_many :comments
  acts_as_inkwell_post


  mount_uploader :photo_image, PhotoImageUploader

end
