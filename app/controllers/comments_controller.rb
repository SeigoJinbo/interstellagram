class CommentsController < ApplicationController
  def create
    raise
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html do
          redirect_to @post, notice: 'Comment was successfully created.'
        end # changed the redirect to @post
      end
    end
  end
end
