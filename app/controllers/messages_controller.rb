class MessagesController < ApplicationController
  before_action :authenticate_user!
  def index
  end
  
  def new
    @message = current_user.sent_messages.new()
  end

  def create
    @message = current_user.sent_messages.new
    m1 = message_params
    @email = m1[:receiver_id]
    if User.exists?(email: @email)
      m1[:receiver_id] = User.find_by_email(@email).id
      @message = current_user.sent_messages.new(m1)
      @message.save!
      if @message.save!
        redirect_to dashboard_index_path
      else
        redirect_to new_message_path(current_user)
      end
    else
      @message.errors.add(:receiver_id,"does not exists.")
    end
  end

  private

  def message_params
    params.require(:message).permit(:receiver_id, :content)
  end
end
