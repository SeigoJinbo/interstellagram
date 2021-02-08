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
    @post = Post.new(post_params)
    @post.user = current_user
    generate_tags(users, @post)
    if @post.save
      redirect_to post_path(@post)
    else
      flash[:notice] = 'you need to upload an image'
      render 'posts/new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    users = params[:post][:tagged_users]
    generate_tags(users, @post)
    if @post.update(post_params)
      redirect_to user_path(@post.user.user_name)
    else
      render 'posts/edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to user_path(current_user.user_name)
  end

  private

  def post_params
    params.require(:post).permit(:description, :user, images: [])
  end

  def generate_tags(tagged_users, post)
    new_tagged_users = []
    names = tagged_users.to_s.split(', ')
    names.each do |name|
      new_tagged_users <<
        User.where('lower(user_name) ILIKE ?', name.downcase).first
      Notification.create(
        receiver: User.where('lower(user_name) ILIKE ?', name.downcase).first,
        sender: current_user,
        post: post,
        message: 'tagged you in a post'
      )
    end
    @post.tagged_users = new_tagged_users
  end
end
