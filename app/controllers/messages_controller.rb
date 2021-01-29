class MessagesController < ApplicationController
  before_action :find_conversation

  def create
    @message =
      @conversation.messages.new(message_params) { |m| m.user = current_user }

    if @message.save
      redirect_to conversation_path(@conversation)
    else
      render :new
    end
  end

  private

  def find_conversation
    @conversation = Conversation.find(params[:conversation_id])
  end

  def message_params
    params.require(:message).permit(:content, :user, :conversation)
  end
end
