class Admin::AlbumsController < Admin::BaseAdminController
  def new
    @album = Album.new
  end

  def create
    @album = Album.new album_params
    if @album.valid?
      @album.save
      flash[:success] = "Create Album Successfully"
    end
    redirect_to new_admin_album_photo_path(@album.id)
  end

  def index
    @albums = Album.all
  end

  def show
    @album = Album.find params[:id]
  end

  private
  def album_params
    params.require(:album).permit :name, :image, :user_id
  end
end
