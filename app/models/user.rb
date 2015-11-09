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

  has_many :friendships
      has_many :passive_friendships, :class_name => "Friendship", :foreign_key => "friend_id"

      has_many :active_friends, -> { where(friendships: { approved: true}) }, :through => :friendships, :source => :friend
      has_many :passive_friends, -> { where(friendships: { approved: true}) }, :through => :passive_friendships, :source => :user
      has_many :pending_friends, -> { where(friendships: { approved: false}) }, :through => :friendships, :source => :friend
      has_many :requested_friendships, -> { where(friendships: { approved: false}) }, :through => :passive_friendships, :source => :user


      def friends
        active_friends | passive_friends
      end

      def mailboxer_email
        email
      end

  mount_uploader :profile_image, PhotoImageUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
