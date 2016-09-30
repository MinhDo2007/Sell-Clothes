class Product < ActiveRecord::Base
  belongs_to :catelog

  serialize :img_list
  mount_uploader :img, ImageUploader
  mount_uploaders :img_list, ImageUploader

  COLORS = ["white", "black" , "yellow"]
  SIZES = ["XS", "SM", "MD", "LG", "XL"]

  class << self
    def detail_product detail
      result = []
      detail_arr = detail.split(".")
      detail_arr.each do |sentences|
        sentences_arr = sentences.split("\r\n")
        sentences_arr = sentences_arr.reject{|x| x.blank?}
        result << sentences_arr
      end
      result
    end
  end
end
