class Comment < ActiveRecord::Base
  belongs_to :photo
  belongs_to :user
  acts_as_likeable
  acts_as_mentioner
end
