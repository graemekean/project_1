class User < ActiveRecord::Base
  has_many :albums
  has_many :photos
  has_many :comments

  mount_uploader :profile_image, PhotoImageUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
