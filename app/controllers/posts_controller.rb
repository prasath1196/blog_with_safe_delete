class PostsController < ApplicationController

  before_action :fetch_post, only:[:move_to_trash,:destroy,:edit,:update]
  before_action :fetch_posts, only:[:index,:new,:edit,:update,:create]

  def index
  end

  def new
    @post = Post.new
    respond_to do |format|
      format.js {render 'update_post_listing'}
    end
  end

  def edit
    respond_to do |format|
      format.js {render 'update_post_listing'}
    end
  end

  def create
    Post.create!(post_params)
    @modal_action = "close"
    respond_to do |format|
      format.js {render 'update_post_listing'}
    end
  end

  def update
    @post.update(post_params)
    @modal_action ="close"
    respond_to do |format|
      format.js {render 'update_post_listing'}
    end
  end

  def move_to_trash
    SafeDelete.new(@post).call
    redirect_to posts_path
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private
  def fetch_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title,:content,:thrashed)
  end

  def fetch_posts
    @comment = Comment.new
    @posts = Post.where(thrashed:false)
  end
end
