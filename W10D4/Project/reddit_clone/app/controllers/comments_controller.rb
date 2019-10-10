class CommentsController < ApplicationController

  def create
    @comment = current_user.comments.new(comment_params)
    
    if @comment.save
      render plain: "Success"
    else
      flash.now[:errors] = @comment.errors.full_messages
      render :new
    end
  end

  def new
    @comment = Comment.new(post_id: params[:post_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :parent_comment_id)
  end

end
