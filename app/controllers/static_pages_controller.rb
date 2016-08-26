class StaticPagesController < ApplicationController
  def home
    images = Album.last.photos
    @images_arr = StaticPage.slide_image_url images
  end

  def help
  end

  def about
  end
end
