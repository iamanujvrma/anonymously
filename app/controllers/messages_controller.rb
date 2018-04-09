class MessagesController < ApplicationController
  def index
  end
  
  def new
    @message = current_user.sent_messages.new()
  end

  def create
    m1 = message_params
    @email = m1[:receiver_id]
    m1[:receiver_id] = User.find_by_email(@email).id
    @message = current_user.sent_messages.new(m1)
    @message.save!
    if @message.save!
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
