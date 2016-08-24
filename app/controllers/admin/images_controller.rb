# class Admin::ImagesController < Admin::BaseAdminController
#   before_action :set_photo

#   def create
#     add_more_images(images_params[:images])
#     flash[:error] = "Failed uploading images" unless @gallery.save
#     redirect_to :back
#   end

#   private

#   def set_photo
#     @album = Album.find params[:album_id]
#     @photo = @album.photos
#   end

#   def add_more_images(new_images)

#   end
# end