class MessagesController < ApplicationController
  def index
  end
  
  def new
    @message = current_user.sent_messages.new()
  end

  def create
    new_message = message_params
    @email = new_message[:receiver_id]
    @receiver = User.find_by_email(@email)
    if @receiver
      new_message[:receiver_id] = @receiver.id
      @message = current_user.sent_messages.new(new_message)
      if @message.save
        redirect_to dashboard_index_path
      else
        @message[:receiver_id] = @email
        render 'new'
      end
    else
      @message = current_user.sent_messages.new(new_message)
      @message.errors.add(:receiver_id, "id does not exist")
      render 'new'
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
