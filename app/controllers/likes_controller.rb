class LikesController < ApplicationController
  before_action :find_target
  before_action :find_like, only: %i[destroy]
  def create
    if already_liked?
      flash[:notice] = "You can't like more than once"
    else
      @target.likes.create(user_id: current_user.id)
      if params[:post_id]
        Notification.create(
          receiver: @target.user,
          sender: current_user,
          post: @target,
          message: 'liked your post'
        )
      end
    end
    redirect_to request.referrer
  end

  def destroy
    if !(already_liked?)
      flash[:notice] = 'Cannot unlike'
    else
      @like.destroy
    end
    redirect_to request.referrer
  end

  private

  def find_target
    if params[:post_id]
      @target = Post.find(params[:post_id])
    else
      @target = Comment.find(params[:comment_id])
    end
  end
  def already_liked?
    if params[:post_id]
      Like.where(user_id: current_user.id, post_id: params[:post_id]).exists?
    else
      Like.where(user_id: current_user.id, comment_id: params[:comment_id])
        .exists?
    end
  end
  def find_like
    @like = @target.likes.find(params[:id])
  end
end
