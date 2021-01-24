class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post =
      Post.new(description: params[:post][:description], user: current_user)

    if @post.save
      redirect_to post_path(@post)
    else
      render 'posts/new'
    end
  end
end
