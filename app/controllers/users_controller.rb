class UsersController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(parent_id: params[:parent_id])
  end

  def create; end

  def edit
    @user = User.find_by('LOWER(user_name)= ?', params[:user_name].downcase)
  end

  def update
    @user = User.find(params[:user_name].downcase)
    if @user.update(user_params)
      redirect_to user_path(@user.user_name)
    else
      render :edit
    end
  end

  def show
    @user = User.find_by('LOWER(user_name)= ?', params[:user_name].downcase)
    @user_posts = @user.posts.sort_by { |created_at| created_at }.reverse
  end

  def followers
    @user =
      User.find_by('LOWER(user_name)= ?', params[:user_user_name].downcase)
    @followers = @user.followers
  end
  def following
    @user =
      User.find_by('LOWER(user_name)= ?', params[:user_user_name].downcase)
    @followings = @user.followings
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
    params.require(:user).permit(
      :email,
      :password,
      :image,
      :user_name,
      :bio,
      :birthday,
      :website,
      :gender,
      :name
    )
  end
end
