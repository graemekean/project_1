class User < ActiveRecord::Base
  has_many :albums
  has_many :photos
  has_many :comments
  # acts_as_inkwell_user
  acts_as_messageable
  acts_as_followable
  acts_as_follower
  acts_as_liker
  acts_as_mentionable

  mount_uploader :profile_image, PhotoImageUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
