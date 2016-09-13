class Admin::CompaniesController < Admin::BaseAdminController
  def new
    @company = Company.new
  end

  def index
    @companies = Company.all
  end

  def create
    @company = Company.new company_params
    if @company.valid?
      @company.save
      flash[:success] = "Create Company Successfully"
    end
    redirect_to admin_companies_path
  end

  private
  def company_params
    params.require(:company).permit :latitude, :longitude, :name, :address, :title
  end
end
