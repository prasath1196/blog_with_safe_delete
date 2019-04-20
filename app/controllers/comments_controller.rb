class CommentsController < ApplicationController

  before_action :fetch_comment, only:[:move_to_trash,:destroy,:edit,:update]

  def create
    @comment = Comment.create!(comment_params)
    respond_to do |format|
      format.js {render 'update_comment_listing'}
    end
  end
  def move_to_trash
    SafeDelete.new(@comment).call
    redirect_to posts_path
  end
  def destroy
    @comment.destroy
    redirect_to posts_path
  end

  def edit
    @modal_action ="open"
    respond_to do |format|
      format.js {render 'update_comment_listing'}
    end
  end

  def update
    @comment.update(comment_params)
    @modal_action = "close"
    respond_to do |format|
      format.js {render 'update_comment_listing'}
    end
  end
  private
  def fetch_comment
    @comment =  Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content,:thrashed,:post_id)
  end
end
