class CommentsController < ApplicationController

  before_action :fetch_comment, only:[:move_to_trash,:destroy]
  def move_to_trash
    SafeDelete.new(@comment).call
    redirect_to posts_path
  end
  def destroy
    @comment.destroy
    redirect_to posts_path
  end
  private
  def fetch_comment
    @comment =  Comment.find(params[:id])
  end
end
