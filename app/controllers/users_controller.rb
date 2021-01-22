class UsersController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(parent_id: params[:parent_id])
  end
  def show
    @user = User.find(params[:id])
  end
end
