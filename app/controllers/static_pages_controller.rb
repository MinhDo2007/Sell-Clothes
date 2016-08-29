class StaticPagesController < ApplicationController
  def home
    images = Album.last.photos
    @list_image = StaticPage.slide_image_url images
    respond_to :html, :json
  end

  def help
  end

  def about
  end
end
