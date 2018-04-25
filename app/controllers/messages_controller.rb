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
    if message_saved
      redirect_to dashboard_index_path
    else
      redirect_to new_message_path(current_user)
    end
  end

  def unlock
    id = params[:id].to_i
    current_message = current_user.received_messages.find(id)
    current_message[:is_unlocked] = 1
    current_message.save!
    redirect_to dashboard_index_path
  end

  def like
    message_id = params[:id].to_i
    current_message = current_user.received_messages.find(message_id)
    current_message.is_liked = 1 
    current_message.save
    redirect_to dashboard_index_path
  end

  private

  def message_params
    params.require(:message).permit(:receiver_id, :content)
  end
end
