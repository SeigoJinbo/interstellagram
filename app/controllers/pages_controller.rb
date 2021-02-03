class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home]

  def home
    @posts = get_feed if current_user
  end

  def inbox
    @user = current_user
  end

  private

  def get_feed
    posts = []
    current_user.followings.each do |user|
      user.posts.each { |post| posts << post if user.posts.any? }
    end
    return posts.sort_by { |post| post.created_at }.reverse
  end
end
