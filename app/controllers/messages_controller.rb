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
