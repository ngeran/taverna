class Album < ActiveRecord::Base
  # Album has many photos
  has_many    :photos, :inverse_of => :album, :dependent => :destroy
end
