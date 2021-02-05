class SearchController < ApplicationController
  def index
    if params[:query].start_with?('#')
      query = params[:query].gsub('#', '')
      @posts = Post.joins(:hash_tags).where(hash_tags: { name: query })
    else
      @posts =
        Post.where('lower(description) like ?', "%#{params[:query].downcase}%")
      @users =
        (
          User.where(
            'lower(user_name) like ?',
            "%#{params[:query].downcase}%"
          ) + User.where('lower(name) like ?', "%#{params[:query].downcase}%")
        ).uniq
      @tags =
        HashTag.where('lower(name) like ?', "%#{params[:query].downcase}%")
          .uniq { |hash| hash.name }
    end
  end
end
