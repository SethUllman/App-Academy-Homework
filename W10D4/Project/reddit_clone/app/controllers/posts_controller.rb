class PostsController < ApplicationController

  #before_action :require_user, only: [:edit, :update]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = 1
    if @post.save
      render plain: "Success" 
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    
    if @post.update(post_params)
       render plain: "Success" 
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
     render plain: "Success" 
  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :content, sub_ids:[])
  end

end
