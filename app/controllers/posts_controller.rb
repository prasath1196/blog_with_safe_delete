class PostsController < ApplicationController

  before_action :fetch_post, only:[:move_to_trash,:destroy]
  def index
    @posts = Post.where(thrashed:false)
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
end
