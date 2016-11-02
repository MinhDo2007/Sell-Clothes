class BlogsController < ApplicationController
  def new
    @blog = Blog.new
  end

  def index
    @blogs = Blog.order_blogs
    @blogs_sort = Blog.get_four_last_blogs @blogs
  end

  def create
    @blog = Blog.new blog_params
    if @blog.valid?
      @blog.save
      flash[:success] = "Create Blog Successfully"
    end
    redirect_to :back
  end


  private
  def blog_params
    params.require(:blog).permit :image, :title, :content, :user_id
  end
end
