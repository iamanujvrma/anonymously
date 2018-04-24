class MessagesController < ApplicationController
  def index
  end
  
  def new
    @message = current_user.sent_messages.new()
  end

  def create
    new_message = message_params
    @email = new_message[:receiver_id]
    new_message[:receiver_id] = User.find_by_email(@email).id
    @message = current_user.sent_messages.new(new_message)
    message_saved = @message.save
    if message.saved
      redirect_to dashboard_index_path
    else
      redirect_to new_message_path(current_user)
    end
  end

  private

  def message_params
    params.require(:message).permit(:receiver_id, :content)
  end
end
