class TrashesController < ApplicationController
  before_action :fetch_post, only:[:restore_post]
  before_action :fetch_comment, only:[:restore_comment]
  def index
    @posts =  Post.where(thrashed:true)
    # Fetching comments for which posts are not trashed but comments are trashed
    active_posts = Post.where(thrashed:false)
    comment_ids = []
    active_posts.each do |post|
      comment_ids.concat (post.comments.where(thrashed:true).pluck(:id))
    end
    @comments = Comment.where(id:comment_ids)
  end

  def restore_post
    Restore.new(@post).call
    redirect_to trashes_path
  end

  def restore_comment
    Restore.new(@comment).call
    redirect_to trashes_path
  end

  private
  def fetch_post
    @post =  Post.find(params[:id])
  end
  def fetch_comment
    @comment =  Comment.find(params[:id])
  end
end
