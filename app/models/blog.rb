class Blog < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  mount_uploader :image, ImageUploader

  scope :order_blogs, ->{order(created_at: :desc)}
  scope :get_user_blogs, ->(user_id){where(user_id: user_id).order(created_at: :desc)}

  class << self
    def get_four_last_blogs blog_arr
      blog_arr = blog_arr.sort{|x,y| x <=> y}
      blog_arr.map.with_index {|x, i| x if i < 3}
      blog_arr = blog_arr.compact
    end
  end
end
