class StaticPagesController < ApplicationController
  def home
    if user_signed_in? && Album.all.present?
      @images = Album.last.photos
      @list_image = StaticPage.slide_image_url @images
      @blog = Blog.last
      @products = Product.all
      respond_to :html, :json
    end
  end

  def help
  end

  def about
  end
end
