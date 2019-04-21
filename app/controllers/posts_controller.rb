class PostsController < ApplicationController

  before_action :fetch_post, only:[:move_to_trash,:destroy,:edit,:update]
  before_action :fetch_posts, only:[:index,:new,:edit]
  after_action :fetch_posts, only: [:update]
  before_action :new_comment

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
    @posts = Post.where(thrashed:false)
    respond_to do |format|
      format.js {render 'update_post_listing'}
    end
  end

  def update
    @post.update(post_params)
    @modal_action ="close"
    @posts = Post.where(thrashed:false)
    respond_to do |format|
      format.js {render 'update_post_listing'}
    end
  end

  def move_to_trash
    SafeDelete.new(@post).call
    @modal_action = "close"
    @posts = Post.where(thrashed:false)
    respond_to do |format|
      format.js{render 'posts/update_post_listing'}
    end
  end

  def destroy
    @modal_action = "close"
    @post.destroy!
    @posts = Post.where(thrashed:false)
    respond_to do |format|
      format.js {render 'posts/update_post_listing'}
    end

  end

  private
  def fetch_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title,:content,:thrashed)
  end

  def fetch_posts
    @posts = Post.where(thrashed:false)
  end

  def new_comment
    @comment = Comment.new
  end
end
