class Photo < ActiveRecord::Base
  #photo belongs to album
  belongs_to :album, :counter_cache => true
  #validations
  validates 	:album, presence: true
  # Photo uploader using carrierwave
  mount_uploader :image, PhotoUploader
end
