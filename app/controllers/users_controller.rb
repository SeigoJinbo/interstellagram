class UsersController < ApplicationController
  def new
    raise
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(parent_id: params[:parent_id])
    raise
  end

  def create
    raise
    @user = User.find(params[user_params])
    default_avatar unless @user.image.has_many_attached
    @user.save ? user_path(@user) : render new
  end

  def show
    @user = User.find_by('LOWER(user_name)= ?', params[:user_name].downcase)
    @user_posts = @user.posts.sort_by { |created_at| created_at }.reverse
  end


  def to_param
    user_name
  end

  private

  def default_avatar
    user_avatar =
      URI.open(
        'https://res.cloudinary.com/dsshrge9u/image/upload/v1612147515/Default_Avatar_120px_g4wjzk.png'
      )
    @user.image.attach(
      io: user_avatar, filename: 'user_avatar.png', content_type: 'image/png'
    )
  end

  def user_params
    params.require(:user).permit(:email, :password, :images, :user_name)
  end
end
