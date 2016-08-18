class Admin::AlbumsController < Admin::BaseAdminController
  def new
    @album = Album.new
  end

  def create
    binding.pry
    @album = Album.new album_params
    if @album.valid?
      @album.save
      flash[:success] = "Create Album Successfully"
    end
    redirect_to admin_albums_path
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
