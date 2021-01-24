class UsersController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(parent_id: params[:parent_id])
  end
  def show
    @user = User.find_by('LOWER(user_name)= ?', params[:user_name].downcase)
  end
  def to_param
    user_name
  end
end
