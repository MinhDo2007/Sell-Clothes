class Album < ActiveRecord::Base
  has_many :photos
  belongs_to :user
  mount_uploader :image, ImageUploader


  class << self
    def get_name_user user_id
      user = User.find user_id
      user.name
    end
  end
end
