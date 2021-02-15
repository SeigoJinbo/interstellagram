class CommentsController < ApplicationController
  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments
  end
  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(parent_id: params[:parent_id])
  end
  def create
    @post = Post.find(params[:post_id])

    @comment =
      @post.comments.new(
        user: current_user,
        post_id: params[:post_id],
        parent_id: params[:comment][:parent_id],
        content: params[:comment][:content]
      )
    if @comment.save
      redirect_to request.referrer, notice: 'Comment was successfully created.'
      if @comment.parent_id
        Notification.create(
          post: @post,
          receiver: Comment.find(Comment.last.parent_id).user,
          sender: current_user,
          message: 'replied to your comment'
        )
      else
        Notification.create(
          post: @post,
          receiver: @post.user,
          sender: current_user,
          message: 'commented on your post'
        )
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to request.referrer
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
