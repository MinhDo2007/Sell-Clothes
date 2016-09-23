class Admin::ProductsController < Admin::BaseAdminController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find params[:id]
    @detail = Product.detail_product @product.detail
  end

  def new
    @product = Product.new
    @catelogs = Catelog.all
  end

  def create
    binding.pry
    @product = Product.new product_params
    if @product.valid?
      @product.save
      flash[:success] = "Created Product Successfully"
    end
    redirect_to admin_products_path
  end

  private
  def product_params
    params.require(:product).permit :name, :price, :discount, :img, {img_list: []}, :count_buy, :view, :catelog_id, :detail
  end
end
