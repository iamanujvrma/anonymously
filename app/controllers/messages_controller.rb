class MessagesController < ApplicationController
  def index
  end
  
  def new
    @message = current_user.sent_messages.new()
  end

  def create
    parameters = message_params
    @email = parameters[:receiver_id]
    @receiver = User.find_by_email(@email)
    if @receiver and @receiver != current_user
      parameters[:receiver_id] = @receiver.id
      @message = current_user.sent_messages.new(parameters)
      if @message.save!
        redirect_to dashboard_index_path
      else
        redirect_to new_message_path(current_user)
      end
    else
      redirect_to new_message_path(current_user)
    end
  end

  private

  def message_params
    params.require(:message).permit(:receiver_id, :content)
  end
end
