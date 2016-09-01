class Admin::PhotosController < Admin::BaseAdminController
	before_action :find_photo

	def new
      @photo = Photo.new
	end

	def index
		@album = Album.find params[:album_id]
		@photos = @album.photos
	end

	def create
		unless check_album_present?
			@photo = Photo.new photo_params
			if @photo.valid?
				@photo.save
				flash[:success] = "Add Photo in Album Successfully"
			end

		else
			images = params[:photo][:images] + @photos[0].images
			@photos[0].update! images: images
		end
		redirect_to :back
	end

	private
	def photo_params
		params.require(:photo).permit(:album_id, {images: []})
	end

	def find_photo
		@album = Album.find params[:album_id]
		@photos = @album.photos
	end

	def check_album_present?
		return true if @photos.present?
	end
end
