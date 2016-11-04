class CommentsController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }
  before_action :find_blogs
  before_action :find_comment, only: [:destroy, :edit, :update]
  before_action :find_comments, only: [:destroy, :create, :update]

  def new
    @comment = Comment.new
  end

  def create
    @comment = @blog.comments.new comment_params
    @comment.save
    respond_to do |format|
      format.json {render json: @comments}
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.json {render json: @comments}
    end
  end

  def edit
  end

  def update
    @comment.update(content: params[:content])
    respond_to do |format|
      format.json {render json: @comments}
    end
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
    params.permit :content, :blog_id, :user_id
  end
end
