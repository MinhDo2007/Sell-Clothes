class StaticPage < ActiveRecord::Base
  def self.slide_image_url images
    result = ""
    images[0].images.each do |image|
      result += (image.url + ",")
    end
    result.gsub(/\,$/, '')
  end
end
