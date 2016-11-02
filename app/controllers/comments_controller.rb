class CommentsController < ApplicationController
  before_action :find_blogs
  before_action :find_comment, only: [:destroy, :edit, :update]
  before_action :find_comments, only: [:destroy, :create]

  def new
    @comment = Comment.new
  end

  def create
    @last_comment = @blog.comments.blank? ? "" : @blog.comments.last.id
    @comment = @blog.comments.new comment_params
    @comment.user_id = current_user.id
    @comment.save
    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html
      format.js {flash[:success] = "Delete Comment Successfully"}
    end
  end

  def edit
  end

  def update
  end

  private
  def find_comments
    @comments = @blog.comments
  end

  def find_blogs
    @blog = Blog.find(params[:blog_id])
  end

  def find_comment
    @comment = @blog.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit :content
  end
end
