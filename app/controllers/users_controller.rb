class UsersController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(parent_id: params[:parent_id])
  end
  def show
    @user = User.find_by('LOWER(user_name)= ?', params[:user_name].downcase)
    @user_posts = @user.posts.sort_by { |created_at| created_at }.reverse
  end
  def to_param
    user_name
  end
end
