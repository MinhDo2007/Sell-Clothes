class Photo < ActiveRecord::Base
  serialize :images
  belongs_to :album
  mount_uploaders :images, ImageUploader
end
