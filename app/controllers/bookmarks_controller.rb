class BookmarksController < ApplicationController
	before_action :find_post, only: %i[new create destroy]
	before_action :find_bookmark, only: %i[destroy]
	def index
		@bookmarks = current_user.bookmarks
	end

	def create
		if already_bookmarked?
			flash[:notice] = "You can't bookmark more than once"
		else
			@post.bookmarks.create(user_id: current_user.id)
		end
		redirect_to request.referrer
	end

	def destroy
		if !(already_bookmarked?)
			flash[:notice] = 'Cannot unbookmark'
		else
			@bookmark.destroy
		end
		redirect_to request.referrer
	end

	private

	def find_post
		@post = Post.find(params[:post_id])
	end

	def already_bookmarked?
		Bookmark.where(user_id: current_user.id, post_id: params[:post_id]).exists?
	end
	def find_bookmark
		@bookmark = @post.bookmarks.find(params[:id])
	end
end
