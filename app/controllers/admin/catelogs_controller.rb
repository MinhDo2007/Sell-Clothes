class Admin::CatelogsController < Admin::BaseAdminController
  def index
    @catelogs = Catelog.all
  end

  def new
    @catelog = Catelog.new
  end

  def create
    @catelog = Catelog.new catelog_params
    if @catelog.valid?
      @catelog.save
      flash[:success] = "Created Catelog Succsessfully"
    end
    redirect_to admin_catelogs_path
  end

  private
  def catelog_params
    params.require(:catelog).permit :name
  end
end
