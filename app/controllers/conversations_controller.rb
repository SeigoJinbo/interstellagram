class ConversationsController < ApplicationController
  def index
    @conversations = current_user.conversations
  end
  def show
    @conversation = Conversation.find(params[:id])
  end
  def create
    @user = User.find(params[:user_user_name])
    @conversation = Conversation.new
    @conversation.users << @user
    @conversation.users << current_user

    if @conversation.save
      redirect_to conversation_path(@conversation)
    else
      render 'users/show'
    end
  end
end
