class ConnectionsController < ApplicationController
	before_action :find_user
	before_action :find_connection, only: %i[destroy]
	def create
		if already_following?
			flash[:notice] = "You're already following this account"
		else
			Connection.create(following: @user, follower: current_user)
			Notification.create(
				receiver: @user,
				sender: current_user,
				message: 'joined your fleet of followers',
			)
		end
		redirect_to user_path(@user.user_name)
	end

	def destroy
		if !(already_following?)
			flash[:notice] = 'Cannot unfollow'
		else
			@connection.destroy
		end
		redirect_to user_path(@user.user_name)
	end

	private

	def find_user
		@user = User.find(params[:user_user_name])
	end

	def already_following?
		Connection.where(following: @user, follower: current_user).exists?
	end
	def find_connection
		@connection = @user.connections_as_following.find(params[:id])
	end
end
