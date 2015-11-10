class Album < ActiveRecord::Base
  has_many :photos, :inverse_of => :album, :dependent => :destroy
  belongs_to :user

end
